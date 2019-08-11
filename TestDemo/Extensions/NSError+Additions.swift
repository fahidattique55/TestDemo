//
//  NSError+Additions.swift
//  TestDemo
//
//  Created by Fahad Attique on 10/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import Foundation

let appDomain = "com.appDomain"
let generalAppError = "Something went wrong."

public extension NSError {
    convenience init(errorMessage: String?, code: Int? = nil) {
        
        var errorMessage = errorMessage
        if errorMessage == nil {
            errorMessage = generalAppError
        }
        var errorCode = -1
        if let code = code { errorCode = code }
        self.init(domain: appDomain, code: errorCode, userInfo: [NSLocalizedDescriptionKey: errorMessage!])
    }
}
