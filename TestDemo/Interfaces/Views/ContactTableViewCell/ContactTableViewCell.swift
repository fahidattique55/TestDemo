//
//  ContactTableViewCell.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var contactName: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Function
    
    func configure(contact: Contact) {
     
        contactName.text = contact.fullName
    }
}
