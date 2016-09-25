//
//  NewsPage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-25.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class NewsPages: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "RBC News"
    }
    
    
}

extension NewsPages:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        
        return cell
    }
}
