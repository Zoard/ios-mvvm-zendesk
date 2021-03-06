//
//  TicketApiServiceProtocol.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol TicketServiceProtocol {
    func get() -> SignalProducer<TicketsResponse,Error>
    func post(openTicket: OpenTicket) -> SignalProducer<OpenTicketResponse,Error>
}
