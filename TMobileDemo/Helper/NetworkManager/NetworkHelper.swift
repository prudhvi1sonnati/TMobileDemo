//
//  NetworkHelper.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import Foundation
import Alamofire

protocol EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    
}

enum RequestItemsType {
    
    // MARK: EndPoints
    
    case users
    case userDetail(String)
    case userRepo(String)
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        return "https://api.github.com/"
        //  return "https://pipio.serveo.net/api/"
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        case .userRepo(let userName):
            return "users/\(userName)/repos"
        case .userDetail(let userName):
            return "users/\(userName)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return [
                "Authorization"     : "Bearer \(accessToken)",
                "Accept"            : "application/vnd.github.v3+json",
                "Accept-Encoding"   : "gzip",
                "Content-Type"      :"application/json; charset=utf-8"
            ]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL +  self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}
