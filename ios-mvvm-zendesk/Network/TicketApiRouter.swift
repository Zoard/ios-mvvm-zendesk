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

// TOKEN sAkLob3HoVEEUhchWrM9RPiyrnP900AESRpy6c8Y

enum TicketApiRouter: URLRequestConvertible {
    
    case get
    case post(subject: String, comment: String)
    
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
        case .post(let subject, let comment):
            return ["ticket" : ["subject" : subject, "comment" : comment]]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        
        let base64Token = "Basic " + "zoard.albuquerque@hbsis.com.br/token:sAkLob3HoVEEUhchWrM9RPiyrnP900AESRpy6c8Y".toBase64()
        request.addValue(base64Token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let parameters = parameters {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        
        switch self {
        case .post:
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        case .get:
            break
        }
        
        return request
    }
    
}
