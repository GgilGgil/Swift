//
//  Book.swift
//  VisualBookManager
//
//  Created by Park GilNam on 2017. 12. 14..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import Foundation

struct Book {
    var name:String?
    var author:String?
    var genre:String?
    
    func bookPrint() {
        print("Name : \(name!)")
        print("Author : \(author!)")
        print("Genre : \(genre!)")
        print("====================")
    }
}
