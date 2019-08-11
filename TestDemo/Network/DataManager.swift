//
//  DataManager.swift
//  TestDemo
//
//  Created by Fahad Attique on 10/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

let dataManager = DataManager.shared

class DataManager {
    
    // MARK: - Static
    
    static let shared = DataManager()

    // MARK: - Life Cycle
    
    private init() {}
    
    // MARK: - Functions
    
    func request(from resource: String) -> (Data?, Error?) {

        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return (data, nil)
            } catch let error {
                return (nil, error)
            }
        } else {
            let error = NSError(errorMessage: "Unable to load JSON resource.", code: -1)
            return (nil, error)
        }
    }
}
