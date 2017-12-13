//
//  ViewController.swift
//  VisualBookManager
//
//  Created by Park GilNam on 2017. 12. 13..
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
        
        let book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "해리포터", genre: "판타지", author: "조앤롤링")
        let book3 = Book(name: "아무개", genre: "순정", author: "무명")
               
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func registerAction(_ sender:Any) {
        var bookTemp = Book()
        
        bookTemp.name = nameTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.genre = genreTextField.text!
        
        myBookManager.registerBook(bookObject: bookTemp)
        
        outputTextView.text = "\(nameTextField.text!) has been registered."
        
        countLabel.text = "\(myBookManager.countBooks())"

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
        
        outputTextView.text = "\(nameTextField.text!) removed"
        
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func showAllBooksAction(_ sender:Any) {
        outputTextView.text = myBookManager.showAllBooks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

