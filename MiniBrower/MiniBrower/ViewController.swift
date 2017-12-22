//
//  ViewController.swift
//  MiniBrower
//
//  Created by Park GilNam on 2017. 12. 15..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initURL = "https://www.facebook.com"
        let myURL = URL(string: initURL)
        let myRequest = URLRequest(url: myURL!)
        mainWebView.load(myRequest)
        
        urlTextField.text = initURL
    }
    
    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkURL = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        
        let urlString:String = "https://www.\(bookMarkURL!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        
        urlTextField.text = urlString
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        
    }
    
    @IBAction func goForwordAction(_ sender: Any) {
        
    }
    
    @IBAction func stopLoadingAction(_ sender: Any) {
        
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

