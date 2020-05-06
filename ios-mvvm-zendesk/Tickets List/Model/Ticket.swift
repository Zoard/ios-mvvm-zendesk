//
//  Ticket.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import ObjectMapper

class TicketsResponse: Mappable {
    
    var tickets: Array<Ticket>
    
    init() {
        self.tickets = []
    }
    
    required init?(map: Map) {
        self.tickets = []
    }
    
    func mapping(map: Map) {
        tickets <- map["tickets"]
    }
    
}

class Ticket: Mappable {
    
    var id: Int
    var createdAt: String
    var type: String
    var subject: String
    var description: String
    var priority: String
    var status: String
    var requesterId: CLong
    
    init() {
        self.id = 0
        self.createdAt = ""
        self.type = ""
        self.subject = ""
        self.description = ""
        self.priority = ""
        self.status = ""
        self.requesterId = 0
    }
    
    required init?(map: Map) {
        self.id = 0
        self.createdAt = ""
        self.type = ""
        self.subject = ""
        self.description = ""
        self.priority = ""
        self.status = ""
        self.requesterId = 0
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["created_at"]
        type <- map["type"]
        subject <- map["subject"]
        description <- map["description"]
        priority <- map["priority"]
        status <- map["status"]
        requesterId <- map["requesterId"]
    }
}
