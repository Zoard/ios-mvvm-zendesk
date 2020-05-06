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
    case post(subject: String, comment: String)
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
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
        
        let base64Token = NetworkConstants.base64Token
        request.addValue(base64Token, forHTTPHeaderField: NetworkConstants.authHeader)
        request.addValue(NetworkConstants.applicationType, forHTTPHeaderField: NetworkConstants.acceptHeader)
        
        if let parameters = parameters {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        
        switch self {
        case .post:
            request.addValue(NetworkConstants.applicationType, forHTTPHeaderField: NetworkConstants.contentTypeHeader)
        case .get:
            break
        }
        
        return request
    }
    
}
