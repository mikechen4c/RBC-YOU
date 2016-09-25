//
//  ApplicationLastPage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class ApplicationLastPage: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
