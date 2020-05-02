//
//  TicketsListViewModel.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class TicketsListViewModel {
    
    private let ticketService: TicketServiceProtocol
    
    let loading = MutableProperty<Bool>(false)
    let tickets = MutableProperty<[Ticket]>([])
    
    init(ticketService: TicketServiceProtocol) {
        self.ticketService = ticketService
        loadTickets()
    }
    
    private func loadTickets() {
        self.ticketService.get()
        .on(starting: {self.loading.value = true})
        .flatMap(.latest, { (tickets) -> SignalProducer<[Ticket],Error> in
            return SignalProducer<[Ticket],Error>(value: tickets)
        })
        .on(completed: {self.loading.value = false})
        .observe(on: UIScheduler())
        .startWithResult({ (result) in
            if let tickets = result.value {
                self.tickets.value = tickets
                print(tickets[0].subject)
            } else {
                print("Error")
                print(result.error.debugDescription)
            }
        })
    }
}


