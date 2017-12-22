//
//  ViewController.swift
//  FlightBooking
//
//  Created by Park GilNam on 2017. 12. 22..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var departureDateButton: UIButton!
    @IBOutlet weak var returnDateButton: UIButton!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    var buttonTag:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
        
        selectDatePicker.backgroundColor = UIColor.white
    }
    
    @IBAction func showDatePickerAction(_ sender: UIButton) {
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        } else {
            selectDatePicker.isHidden = false
        }
        
        buttonTag = sender.tag
    }
    
    @IBAction func showReturnDateAction(_ sender: UISwitch) {
//        if (sender as! UISwitch).isOn {
//            returnDateLabel.isHidden = false
//            returnDateButton.isHidden = false
//        } else {
//            returnDateLabel.isHidden = true
//            returnDateButton.isHidden = true
//        }
        returnDateLabel.isHidden = !sender.isOn
        returnDateButton.isHidden = !sender.isOn
    }
    
    @IBAction func selectedDateAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        
        let dateString = formatter.string(from: sender.date)
        
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: UIControlState.normal)
        } else {
            returnDateButton.setTitle(dateString, for: UIControlState.normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        selectDatePicker.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

