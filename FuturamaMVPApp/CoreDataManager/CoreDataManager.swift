//
//  CoreDataManager.swift
//  FuturamaMVPApp
//
//  Created by Yaroslav on 01.08.2022.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private var characters = [Characters()]
    
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Methods
    func fetchRequest() {
        let fetchRequest: NSFetchRequest<Characters> = Characters.fetchRequest()
        
        do {
            characters = try viewContext.fetch(fetchRequest)
        } catch let dataError{
            print("Failed to fatch data, \(dataError.localizedDescription)")
        }
    }
    
    func save(_ character: Character, into completion: (Characters) -> Void) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Characters", in: viewContext) else { return }
        
        guard let coreDataCharacter = NSManagedObject(entity: entityDescription, insertInto: viewContext) as? Characters else { return }
        coreDataCharacter.species = character.species
        coreDataCharacter.age = character.age
        coreDataCharacter.planet = character.planet
        coreDataCharacter.profession = character.profession
        coreDataCharacter.status = character.status
        coreDataCharacter.firstAppearanse = character.firstAppearanse
        coreDataCharacter.picURL = character.picURL
        coreDataCharacter.name = character.name
        
        completion(coreDataCharacter)
        saveContext()
    }
    
    func delete(character: Characters) {
        viewContext.delete(character)
        saveContext()
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

  
