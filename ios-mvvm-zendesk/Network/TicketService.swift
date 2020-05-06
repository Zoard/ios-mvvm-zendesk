//
//  TicketService.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveSwift
import ObjectMapper
import AlamofireObjectMapper

struct TicketService: TicketServiceProtocol {
    
    func get() -> SignalProducer<TicketsResponse,Error> {
        return SignalProducer { observer, disposable in
            Alamofire
                .request(TicketApiRouter.get)
                .validate()
                .responseObject { (response: DataResponse<TicketsResponse>) in
                    switch response.result {
                    case .success:
                        observer.send(value: response.result.value!)
                        observer.sendInterrupted()
                    case .failure(let error):
                        observer.send(error: error)
                    }
            }
        }
    }
    
    func post(openTicket: OpenTicket) -> SignalProducer<OpenTicketResponse,Error> {
        return SignalProducer { observer, disposable in
            Alamofire
                .request(TicketApiRouter.post(subject: openTicket.subject, comment: openTicket.comment))
                .validate()
                .responseObject { (response: DataResponse<OpenTicketResponse>) in
                    switch response.result {
                    case .success:
                        observer.send(value: response.result.value!)
                        observer.sendInterrupted()
                    case .failure(let error):
                        observer.send(error: error)
                    }
                
            }
            
        }
    }
}
