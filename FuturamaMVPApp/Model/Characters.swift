//
//  Characters.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 31.07.2022.
//

import Foundation

struct Character: Codable, Hashable {
    let species: String?
    let age: String?
    let planet: String?
    let profession: String?
    let status: String?
    let firstAppearanse: String?
    let picURL: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case firstAppearanse = "FirstAppearance"
        case picURL = "PicUrl"
        case name = "Name"
    }
}
