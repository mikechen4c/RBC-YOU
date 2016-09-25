//
//  AllEvents.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var eventName:String?
    var eventCategory:String?
    var eventLocation:String?
    var eventAddress:String?
    var eventImage:String?
    var eventInfo:String?
    var companyRequirement:String?
    
    init(name:String?, category:String?, location:String?, address:String?, image:String?, info:String, requirement:String?) {
        
        eventName = name
        eventCategory = category
        eventLocation = location
        eventAddress = address
        eventImage = image
        eventInfo = info
        companyRequirement = requirement
    }
}
