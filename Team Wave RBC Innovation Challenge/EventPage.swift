//
//  EventPage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class EventPage: UIViewController {
    
    var selectedEvent:Event?
    
    var filterArr:[Event] = []
    
    var filterSelection:String?
    
    let event1 = Event(name: "RBC campus recruitment", category: "Education", location: "Waterloo", address: "University of Waterloo", image: "event0", info: "RBC student recruiting event.\nIntroduction to RBC’s departments (Technology, analytics, finance, accounting) Info on application process.", requirement: "Food and drink companies\nEducation companies")
    
    let event2 = Event(name: "RBC NGI Hackathon", category: "Education", location: "Toronto", address:"88 Queens Quay West", image: "event1", info: "An organized hackathon to attract students from all around the world to innovate and develop the next great idea.", requirement: "Food and drink companies\nEducation companies\nMedia Companies\nTechnology Companies")
    
    var eventArr:[Event] = []
    
    lazy var cancelButton:UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelFilter))
        
        return button
    }()
    
    lazy var resetButton:UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(cancelFilter))
        
        
        
        return button
    }()
    
    var selectedFilter:String?
    
    let cvCellId = "cvCellId"
    let tvCellId = "tvCellId"
    
    let titles = ["Categories", "Location"]
    
    @IBOutlet weak var menuBar: UICollectionView!
    
    @IBOutlet weak var infoTable: UITableView!
    
    @IBOutlet weak var filterView: FilterView!
    
    @IBOutlet weak var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        eventArr = [event1, event2]
        filterArr = [event1]
        
        menuBar.delegate = self
        menuBar.dataSource = self
        menuBar.register(MenuCell.self, forCellWithReuseIdentifier: cvCellId)
        
        infoTable.delegate = self
        infoTable.dataSource = self
        infoTable.separatorStyle = .none
        infoTable.tableFooterView = UIView()
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuBar.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
        
        filterView.alpha = 0
        filterView.eventPage = self
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func cancelFilter() {
        
        if filterSelection != nil {
            filterSelection = nil
            infoTable.reloadData()
            
            self.navigationItem.rightBarButtonItem = nil
            selectedFilter = ""
            menuBar.reloadData()
            
        } else {
            
            self.navigationItem.leftBarButtonItem = nil
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                
                self.filterView.alpha = 0
                self.blackView.alpha = 0
                }, completion: nil)
            
            selectedFilter = ""
            menuBar.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            
            if let vc = segue.destination as? EventDetailedPage {
                vc.event = selectedEvent
            }
        }
    }
}

extension EventPage:UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filterSelection != nil {
            
            return filterArr.count
        }
        
        return eventArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if filterSelection != nil {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: tvCellId, for: indexPath) as! EventTableCell
            
            let event = filterArr[indexPath.row]
            
            cell.eventAddress.text = event.eventLocation
            cell.eventCategory.text = event.eventCategory
            cell.eventName.text = event.eventName
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tvCellId, for: indexPath) as! EventTableCell
        
        let event = eventArr[indexPath.row]
        
        cell.eventAddress.text = event.eventLocation
        cell.eventCategory.text = event.eventCategory
        cell.eventName.text = event.eventName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedEvent = eventArr[indexPath.row]
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvCellId, for: indexPath) as! MenuCell
        
        cell.title.text =
            titles[indexPath.item]
        
        if cell.title.text == selectedFilter {
            cell.backgroundColor = .lightGray
        } else {
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            filterView.names = ["Technology", "Education", "Finance"]
            selectedFilter = titles[indexPath.row]
            collectionView.reloadData()
            filterView.tableview.reloadData()
        }
        
        if indexPath.item == 1 {
            filterView.names = ["Toronto", "Vancouver", "Calgary", "Waterloo"]
            selectedFilter = titles[indexPath.row]
            collectionView.reloadData()
            filterView.tableview.reloadData()
        }
        
        self.navigationItem.leftBarButtonItem = self.cancelButton
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            
            self.filterView.alpha = 1
            self.blackView.alpha = 0.3
            }, completion: nil)
    }
}

class MenuCell: BaseCollectionViewCell {
    
    let title:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(title)
        
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
