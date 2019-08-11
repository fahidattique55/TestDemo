//
//  EditContactDetailsTableViewCell.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

class EditContactDetailsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoTextfield: UITextField!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
