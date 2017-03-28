//
//  UserRouter.swift
//  SmartStaff
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    
    static var baseURLString = API_URL
    static var authCode:String?
    
    case get(Int)
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
            case .Login:
                return .post
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .get, .delete:
                return nil
            case .create(let newUser):
                return (newUser)
            case .Login(let param):
                return (param)
            }
        }()
        
        let url:URL = {
            // build up and return the URL for each endpoint
            let relativePath:String?
            switch self {
            case .get(let number):
                relativePath = "todos/\(number)"
            case .create:
                relativePath = "todos"
            case .delete(let number):
                relativePath = "todos/\(number)"
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
