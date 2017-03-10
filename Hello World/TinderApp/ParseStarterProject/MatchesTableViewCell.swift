//
//  MatchesTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by arjun gupta on 10/03/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func send(_ sender: Any) {
    
    
    }
    
    @IBOutlet weak var messageTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
