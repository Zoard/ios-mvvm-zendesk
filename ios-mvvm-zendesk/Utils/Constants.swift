//
//  Constants.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 05/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation

struct AlertConstants {
    static let obrigatoryFieldTitle = "This field is mandatory."
    static let obrigatorySubjectFieldMessage = "You must provide a subject to open a new ticket."
    static let obrigatoryCommentFieldMessage = "You must provide a comment to open a new ticket."
    static let openNewTicketSuccessMessage = "Verify your ticket on your tickets list."
    static let openNewTicketFailedTitle = "Ops! Try again."
}

struct NetworkConstants {
    static let baseURL = "https://zoardhbsis.zendesk.com/api/v2/tickets.json"
    static let base64Token = "Basic " + "zoard.albuquerque@hbsis.com.br/token:sAkLob3HoVEEUhchWrM9RPiyrnP900AESRpy6c8Y".toBase64()
    static let authHeader = "Authorization"
    static let acceptHeader = "Accept"
    static let contentTypeHeader = "Content-Type"
    static let applicationType = "application/json"
}

struct TicketsListConstants {
    static let nibName = "TicketsListView"
    static let navBarTitle = "Your Tickets"
    static let viewCellNibName = "TicketsListViewCell"
}

struct OpenNewTicketConstants {
    static let nibName = "OpenNewTicketView"
    static let navBarTitle = "Open A New Ticket"
}
