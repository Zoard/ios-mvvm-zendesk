//
//  OpenTicket.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import ObjectMapper

class OpenTicketResponse: Mappable {
    
    var ticket: Ticket
    
    init() {
        self.ticket = Ticket()
    }
    
    required init?(map: Map) {
        self.ticket = Ticket()
    }
    
    func mapping(map: Map) {
        ticket <- map["ticket"]
    }
}

class OpenTicket: Mappable {
    
    var subject: String
    var comment: String
    
    init() {
        self.subject = ""
        self.comment = ""
    }
    
    init(_ subject: String, _ comment: String) {
        self.subject = subject
        self.comment = comment
    }
    
    required init?(map: Map) {
        subject = ""
        comment = ""
    }
    
    func mapping(map: Map) {
        subject <- map["subject"]
        comment <- map["comment"]
    }
}
