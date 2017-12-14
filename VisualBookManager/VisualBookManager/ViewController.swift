//
//  ViewController.swift
//  VisualBookManager
//
//  Created by Park GilNam on 2017. 12. 14..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myBookManager = BookManager()
    
    @IBOutlet weak var outputTextView: UITextView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //book init
        let book1 = Book(name: "햄릿", author: "비극", genre: "셰익스피어")
        let book2 = Book(name: "해리포터", author: "판타지", genre: "조앤롤링")
        let book3 = Book(name: "아무개", author: "시", genre: "미상")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        setBookCount()
    }
    
    @IBAction func registerAction(_ sender:Any) {
        var bookTemp = Book()
        
        bookTemp.name = nameTextField.text!;
        bookTemp.author = authorTextField.text!;
        bookTemp.genre = genreTextField.text!;
        
        myBookManager.registerBook(bookObject: bookTemp)
        
        outputTextView.text = "\(nameTextField.text!) has been registered."
        
        setBookCount()
    }
    
    @IBAction func searchAction(_ sender:Any) {
        let resultBook = myBookManager.searchBook(name: nameTextField.text!)
        
        if resultBook != nil {
            outputTextView.text = resultBook
        } else {
            outputTextView.text = "We don't have book that you search."
        }
    }
    
    @IBAction func removeAction(_ sender:Any) {
        myBookManager.removeBook(name: nameTextField.text!)
        
        outputTextView.text = "\(nameTextField.text!) removed."
        
        setBookCount()
    }
    
    @IBAction func showAllBooksAction(_ sender:Any) {
        outputTextView.text = myBookManager.showAllBooks()
    }

    func setBookCount() {
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

