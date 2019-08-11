//
//  ContactsLoader.swift
//  TestDemo
//
//  Created by Fahad Attique on 10/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import Foundation

class ContactLoader {
    
    // MARK: - Functions
    
    func loadContacts(success: @escaping ((_ contacts: [Contact]) -> Void), failureBlock failure: @escaping ((_ error: Error?) -> Void)) {
        
        let (dataFromJSONFile, error) = dataManager.request(from: "contacts")
        if let data = dataFromJSONFile {
            do {
                let contacts = try JSONDecoder().decode([Contact].self, from: data)
                success(contacts)
            }
            catch let error {
                failure(error)
            }
        }
        else {
            failure(error!)
        }
    }
}
