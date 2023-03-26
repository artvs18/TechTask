//
//  PersistenceController.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "Main")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error while saving")
            }
        }
    }
}
