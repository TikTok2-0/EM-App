//
//  Persistence.swift
//  EM App
//
//  Created by Henry Krieger on 12.01.21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Subject(context: viewContext)
            newItem.title = "Deutsch"
            newItem.eA = true
            newItem.abitur = 14
            newItem.abiCheck = true
            newItem.s1 = 10
            newItem.s2 = 11
            newItem.s3 = 10
            newItem.s4 = 13
            
            let newGrade = Grade(context: viewContext)
            newGrade.title = "Deutsch"
            newGrade.grade = 5
            
            let newGradeSix = GradeSix(context: viewContext)
            newGradeSix.title = "Deutsch"
            newGradeSix.grade = 6
            
            let newGradeSeven = GradeSeven(context: viewContext)
            newGradeSeven.title = "Deutsch"
            newGradeSeven.grade = 7
            
            let newGradeEight = GradeEight(context: viewContext)
            newGradeEight.title = "Deutsch"
            newGradeEight.grade = 8
            
            let newGradeNine = GradeNine(context: viewContext)
            newGradeNine.title = "Deutsch"
            newGradeNine.grade = 9
            
            let newGradeTen = GradeTen(context: viewContext)
            newGradeTen.title = "Deutsch"
            newGradeTen.grade = 10
            
            let newHW = Homework(context: viewContext)
            newHW.title = "Text lesen"
            newHW.subject = "Deutsch"
            //newHW.dueDate = 10.03.2020
            newHW.comment = "asap"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "EM_App")
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
    }
}
