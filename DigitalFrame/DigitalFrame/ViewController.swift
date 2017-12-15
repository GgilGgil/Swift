//
//  ViewController.swift
//  DigitalFrame
//
//  Created by Park GilNam on 2017. 12. 15..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgs = [UIImage(named:"1.jpg")!,
                    UIImage(named:"2.jpg")!,
                    UIImage(named:"3.jpg")!,
                    UIImage(named:"4.jpg")!,
                    UIImage(named:"5.jpg")!,
                    UIImage(named:"6.jpg")!,
                    UIImage(named:"7.jpg")!,
                    UIImage(named:"8.jpg")!,
                    UIImage(named:"9.jpg")!,
                    UIImage(named:"10.jpg")!,
                    UIImage(named:"11.jpg")!,
                    UIImage(named:"12.jpg")!,
                    UIImage(named:"13.jpg")!,
                    UIImage(named:"14.jpg")!,
                    UIImage(named:"15.jpg")!]
        
        imgView.animationImages = imgs
        setSpeedLabel()
    }
    
    @IBAction func toggleButtonAction(_ sender:Any) {
        imgViewAnimating(isAnimating: imgView.isAnimating)
    }
    @IBAction func speedSliderAction(_ sender:Any) {
        imgViewAnimating(isAnimating: false)
        setSpeedLabel()
    }
    
    func imgViewAnimating(isAnimating:Bool) {
        if isAnimating {
            toggleButton.setTitle("Start", for: UIControlState.normal)
            imgView.stopAnimating()
        } else {
            imgView.animationDuration = Double(speedSlider.value)
            toggleButton.setTitle("Stop", for: UIControlState.normal)
            imgView.startAnimating()
        }
    }
    
    func setSpeedLabel() {
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

