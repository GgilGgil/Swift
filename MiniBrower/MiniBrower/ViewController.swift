//
//  ViewController.swift
//  MiniBrower
//
//  Created by Park GilNam on 2017. 12. 15..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    
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
        
        mainWebView.navigationDelegate = self
    }
    
    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkURL = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        
        let urlString = "https://www.\(bookMarkURL!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        
        urlTextField.text = urlString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlTextField.text!)"
        }
        
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        
        textField.resignFirstResponder()
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        mainWebView.goBack()
        setUrl()
    }
    
    @IBAction func goForwordAction(_ sender: Any) {
        mainWebView.goForward()
        setUrl()
    }
    
    func setUrl() {
        urlTextField.text = mainWebView.url?.absoluteString
    }
    
    @IBAction func stopLoadingAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        mainWebView.reload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

