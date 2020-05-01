//
//  ApiRouter.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum TicketApiRouter: URLRequestConvertible {
    
    case get
    case post
    
    var baseURL: URL {
        return URL(string: "https://zoardhbsis.zendesk.com/api/v2/tickets.json")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .get:
            return nil
        case .post:
            return nil //TODO: CHANGE PARAMETER
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        
        return request
    }
    
}
