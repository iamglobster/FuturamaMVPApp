//
//  Characters+CoreDataClass.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 03.08.2022.
//
//

import Foundation
import CoreData
import UIKit

@objc(Characters)
class Characters: NSManagedObject {

//    func parseJSON(completed: @escaping ()-> ()) {
//        let url = URL(string: API.stringURL.rawValue)
//        let decoder = JSONDecoder()
//        decoder.userInfo
//    }
    
//    required public  init(from decoder: Decoder) throws {
//        guard let context = decoder.userInfo[.managedObjectContext] as? NSManagedObjectContext else {
//
//        }
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        super.init(entity: <#T##NSEntityDescription#>, insertInto: <#T##NSManagedObjectContext?#>)
//
//    }
}
/* Variant 1
    @NSManaged var property: String?

    enum CodingKeys: String, CodingKey {
        case property = "json_key"
    }

    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.context!] as? NSManagedObjectContext else { fatalError() }
        guard let entity = NSEntityDescription.entity(forEntityName: "Characters", in: context) else { fatalError() }

        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.property = try container.decodeIfPresent(String.self, forKey: .property)
    }

    let data =
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
*/
