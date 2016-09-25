//
//  HomePage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titlesCell = "TitleCell"
    
    let titles = ["RBC Small Business News", "Loan Info", "Business Solutions"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Home"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 150
        }
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogoCell", for: indexPath)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: titlesCell, for: indexPath) as! TitleCell
        
        cell.nameLabel.text = titles[indexPath.row - 1]
        
        cell.backgroundImage.image = UIImage(named: "RBCBackground\(indexPath.row)")
        
        return cell
    }
}
