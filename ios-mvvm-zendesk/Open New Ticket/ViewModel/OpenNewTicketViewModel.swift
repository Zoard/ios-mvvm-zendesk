//
//  OpenTicketViewModel.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class OpenNewTicketViewModel {
    
    private let ticketService: TicketServiceProtocol
    
    let openTicket = MutableProperty<OpenTicketResponse>(OpenTicketResponse())
    let loading = MutableProperty<Bool>(false)
    
    let openNewTicketResult = Signal<Ticket,Error>.pipe()
    
    init(ticketService: TicketServiceProtocol) {
        self.ticketService = ticketService
    }
    
    func openNewTicket(subject: String, comment: String) {
        
        ticketService.post(openTicket: OpenTicket(subject, comment))
            .on(starting: { self.loading.value = true })
            .flatMap(.latest, { (openTicketResponse) -> SignalProducer<OpenTicketResponse,Error> in
                return SignalProducer<OpenTicketResponse,Error>(value: openTicketResponse)
            })
            .on(terminated: { self.loading.value = false })
            .observe(on: UIScheduler())
            .startWithResult({ (result) in
                if let openTicketResponse = result.value {
                    self.openTicket.value = openTicketResponse
                    self.openNewTicketResult.input.send(value: openTicketResponse.ticket)
                } else {
                    self.openNewTicketResult.input.send(error: result.error!)
                    print(result.error!.localizedDescription)
                }
            })
    }
    
}
