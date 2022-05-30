//
//  PersistenceController.swift
//  MultiplyBy
//
//  Created by megared on 30/05/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentCloudKitContainer

    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let persistenceController = PersistenceController(inMemory: true)

        do {
            try persistenceController.createSampleData()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return persistenceController
    }()
    
    func createSampleData() throws {
        let viewContext =  container.viewContext
        
        for _ in 0..<10 {
            let score = Score(context: viewContext)
            score.goodAnswer = Int64.random(in: 0...50)
            score.badAnswer = Int64.random(in: 0...30)
            score.date = Date.now
            score.id = UUID()
        }
        
        try viewContext.save()
    }

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "MultiplyBy")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

