//
//  Item+CoreDataProperties.swift
//  Todey
//
//  Created by sky on 12/27/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var done: Bool
    @NSManaged public var categoryParent: Category?

}

extension Item : Identifiable {

}
