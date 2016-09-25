//
//  EventDetailedPage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class EventDetailedPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var event:Event?
    
    let eventAddress = "EventAddress"
    let eventInfo = "EventInfo"
    let company = "Company"
    let eventImage = "EventImageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        navigationItem.title = event?.eventName
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton;
    }
    
    func back(sender: UIBarButtonItem) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        _ = self.navigationController?.popViewController(animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 150
        }
        
        if indexPath.row == 1 {
            return 90
        }
        
        if indexPath.row == 2 {
            return 200
        }
        
        if indexPath.row == 3 {
            return 150
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: eventImage, for: indexPath) as! EventImageCell
            
            cell.eventImage.image = UIImage(named: (event?.eventImage)!)
            
            return cell
        }
        
        if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: eventAddress, for: indexPath) as! EventAddressCell
            
            cell.eventInfo.text = event?.eventAddress
            
            return cell
        }
        
        if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: eventInfo, for: indexPath) as! EventInfoCell
            
            cell.eventInfo.text = event?.eventInfo
            
            return cell
        }
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: company, for: indexPath) as! CompanyRequirementCell
            
            cell.companyRequirement.text = event?.companyRequirement
            
            return cell
        }
        
        return UITableViewCell()
    }
}
