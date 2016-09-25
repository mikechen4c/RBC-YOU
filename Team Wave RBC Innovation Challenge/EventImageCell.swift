//
//  EventImageCell.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class EventImageCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class EventAddressCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var eventInfo: UILabel!
}

class EventInfoCell: UITableViewCell {
    
    @IBOutlet weak var eventInfo: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class CompanyRequirementCell: UITableViewCell {
    
    @IBOutlet weak var companyRequirement: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
