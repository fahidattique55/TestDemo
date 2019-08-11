//
//  Contact.swift
//  TestDemo
//
//  Created by Fahad Attique on 10/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

struct Contact: Codable, Equatable {

    // MARK: - Properties
    
    var id = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var phone = ""
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
    }

    // MARK: - Keys

    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case phone = "phone"
    }
    
    // MARK: - Life Cycle

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id
    }
}
