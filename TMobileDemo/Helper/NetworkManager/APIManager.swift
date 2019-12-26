//
//  APIManager.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import Reachability

class APIManager {
    
    // MARK: - Vars & Lets
    let reachability = try! Reachability()
    static let errorCodeList =  [400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 421, 422, 423, 424, 425, 426, 427, 428, 429, 431, 451, 500, -1009, -1001]
    
    // MARK: - Public methods
    
    static var shared: APIManager {
        return APIManager()
    }
    
    func call<T>(type: RequestItemsType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        if reachability.connection != .unavailable {
            
            AF.request(type.url, method: type.httpMethod, parameters: params,
                                        encoding: type.encoding,
                                        headers: type.headers).validate().responseJSON { (data) in
                                            do {
                                                guard let jsonData = data.data else {
                                                    throw CustomError(title: "Error", body: "No data")
                                                }
                                                let result = try JSONDecoder().decode(T.self, from: jsonData)
                                                handler(.success(result))
                                            } catch {
                                                if let error = error as? CustomError {
                                                    return handler(.failure(error))
                                                }
                                                handler(.failure(CustomError(title: "Demo", body: "Something went wrong")))
                                            }
            }
        } else {
            handler(.failure(CustomError(title: "Demo", body: "No Internet Connection")))
        }
    }
    
}
