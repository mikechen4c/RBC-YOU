//
//  FilterView.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class FilterView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var names:[String] = []
    
    let cellId = "cellId"
    
    var eventPage:EventPage?
    
    lazy var tableview:UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 50
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(tableview)
        tableview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        eventPage?.filterSelection = names[indexPath.row]
        
        eventPage?.infoTable.reloadData()
        
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            
            self.eventPage?.filterView.alpha = 0
            self.eventPage?.blackView.alpha = 0
            self.eventPage?.navigationItem.leftBarButtonItem = nil
            self.eventPage?.navigationItem.rightBarButtonItem = self.eventPage?.resetButton
            }, completion: nil)
    }
}
