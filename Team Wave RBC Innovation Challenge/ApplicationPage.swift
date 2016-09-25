//
//  ApplicationPage.swift
//  Team Wave RBC Innovation Challenge
//
//  Created by Ziyin Wang on 2016-09-24.
//  Copyright © 2016 Team Wave. All rights reserved.
//

import UIKit

class ApplicationPage: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let industries = ["Technology", "Education", "Finance"]

    
    @IBOutlet weak var companyNameTF: UITextField!
    
    @IBOutlet weak var companyIndustryTF: UITextField!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    let industryPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        industryPickerView.delegate = self
        industryPickerView.dataSource = self
        
        companyIndustryTF.inputView = industryPickerView
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return industries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
         return industries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        companyIndustryTF.text = industries[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}
