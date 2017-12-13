//
//  Book.swift
//  BookManager
//
//  Created by Park GilNam on 2017. 12. 10..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import Foundation

struct Book {
    var name:String?
    var genre:String?
    var author:String?
    
    func bookPrint() {
        print("Name : \(name!)")
        print("Genre : \(genre!)")
        print("Author : \(author!)")
        print("===================")
    }
}
