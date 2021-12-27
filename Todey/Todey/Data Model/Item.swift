//
//  Item.swift
//  Todey
//
//  Created by sky on 12/25/21.
//

import Foundation

// because we want to encode data so we have to conform our data model to Encodable. If we use our owned plist file to store our data model, we need to conform model with Encodable. And every property inside the model must be standard data type like String, Bool, ect. It cannot be customed data type
//class Item: Codable {
//    var title: String = ""
//    var done: Bool = false
//}

// after we don't use UserDefault or Codeable to store data, and use Core Data instead, we will delete this class because we already create an Entity Item with two attribute title and done already
