//
//  ViewController.swift
//  SelectCar
//
//  Created by Park GilNam on 2017. 12. 22..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    let carCompanyName = ["Hyundai", "KIA", "RenaultSamsung"]
    var carModel = [String]()
    var carModelImage = [String]()
    
    let hyundai = ["Avante", "Kona", "Starax"]
    let kia = ["K5", "Sorento", "Carnival"]
    let renaultSamsung = ["SM6", "QM3", "QM6"]
    
    let hyundaiImageNames = ["hyundai_avante.png", "hyundai_kona.png", "hyundai_starex.png"]
    let kiaImageNames = ["kia_k5.png", "kia_sorento.png", "kia_carnival.png"]
    let renaultSamsungImageNames = ["renaultsamsung_sm6.png", "renaultsamsung_qm3.png", "renaultsamsung_qm6.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carModel = hyundai
        carModelImage = hyundaiImageNames
        
        imgView.layer.cornerRadius = 50
        imgView.layer.masksToBounds = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return carCompanyName.count
        } else {
            return carModel.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        } else {
            return carModel[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            carModel = hyundai
            carModelImage = hyundaiImageNames
        } else if component == 0 && row == 1 {
            carModel = kia
            carModelImage = kiaImageNames
        } else if component == 0 && row == 2{
            carModel = renaultSamsung
            carModelImage = renaultSamsungImageNames
        }
        
        pickerView.reloadAllComponents()
        
        imgView.image = UIImage(named:carModelImage[pickerView.selectedRow(inComponent: 1)])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

