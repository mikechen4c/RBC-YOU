//
//  ApplicationFinalPage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class ApplicationFinalPage: UIViewController {
    
    @IBOutlet weak var firstSelection: UILabel!
    
    @IBOutlet weak var secondSelection: UILabel!
    
    @IBOutlet weak var thirdSelection: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.addTarget(self, action: #selector(firstSelect), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(secondSelect), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(thirdSelect), for: .touchUpInside)
    }
    
    func firstSelect() {
        
        firstButton.setImage(UIImage(named: "Selected")
            , for: .normal)
        secondButton.setImage(UIImage(named: "Non-Selected"), for: .normal)
        thirdButton.setImage(UIImage(named: "Non-Selected"), for: .normal)
    }
    
    func secondSelect() {
        secondButton.setImage(UIImage(named: "Selected")
            , for: .normal)
        firstButton.setImage(UIImage(named: "Non-Selected"), for: .normal)
        thirdButton.setImage(UIImage(named: "Non-Selected"), for: .normal)
    }
    
    func thirdSelect() {
        thirdButton.setImage(UIImage(named: "Selected")
            , for: .normal)
        secondButton.setImage(UIImage(named: "Non-Selected"), for: .normal)
        firstButton.setImage(UIImage(named: "Non-Selected"), for: .normal)
    }
    @IBAction func done(_ sender: AnyObject) {
        
        let alert = UIAlertController(title: "Thanks for your submission!", message: "Please check your email in 3-5 days for result!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: "2")
            
            self.present(vc, animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
