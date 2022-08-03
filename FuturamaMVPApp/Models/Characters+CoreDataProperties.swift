//
//  Characters+CoreDataProperties.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 03.08.2022.
//
//

import Foundation
import CoreData


extension Characters {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Characters> {
        return NSFetchRequest<Characters>(entityName: "Characters")
    }

    @NSManaged public var age: String?
    @NSManaged public var firstAppearanse: String?
    @NSManaged public var name: String?
    @NSManaged public var picURL: String?
    @NSManaged public var planet: String?
    @NSManaged public var profession: String?
    @NSManaged public var species: String?
    @NSManaged public var status: String?

}

extension Characters : Identifiable {

}
