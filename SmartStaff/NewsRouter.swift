//
//  NewsRouter.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/29/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import Foundation
import Alamofire
import KeychainAccess

enum NewsRouter: URLRequestConvertible {
    
    static var baseURLString = API_URL
    static var authCode:String?
    
    case get([String: Any])
    case create([String: Any])
    case delete(Int)
    case Login([String: Any])
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .get:
                return .get
            case .create:
                return .post
            case .delete:
                return .delete
            default:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .get(let param):
                return param
            case .create(let newArticle):
                return (newArticle)
            default:
                return nil
            }
        }()
        
        let url:URL = {
            // build up and return the URL for each endpoint
            let relativePath:String?
            switch self {
            case .get(_):
                relativePath = "news"
            case .create:
                relativePath = "todos"
            case.Login(_):
                relativePath = "users/login"
            default:
                relativePath = ""
            }
            
            var url = URL(string: UserRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)

    }
}
