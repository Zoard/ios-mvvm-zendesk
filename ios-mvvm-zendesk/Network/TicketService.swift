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
    
    func get() -> SignalProducer<[Ticket],Error> {
        return SignalProducer { observer, disposable in
            Alamofire
                .request(TicketApiRouter.get)
                .validate()
                .responseObject { (response: DataResponse<TicketResponse>) in
                    switch response.result {
                    case .success:
                        observer.send(value: response.result.value!.tickets)
                        observer.sendInterrupted()
                    case .failure(let error):
                        observer.send(error: error)
                    }
            }
        }
    }
    
//    func post() -> SignalProducer<String, NSError> {
//
//    }
}
