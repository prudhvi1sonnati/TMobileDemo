//
//  CustomError.swift
//  TMobileDemo
//
//  Created by Prudhvi Sonnati on 12/06/19.
//  Copyright © 2019 Prudhvi Sonnati. All rights reserved.
//

import Foundation

class CustomError: Error {
    
    // MARK: - Vars & Lets
    var title = ""
    var body = ""
    
    // MARK: - Intialization
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
}
