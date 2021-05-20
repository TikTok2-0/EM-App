//
//  Homework+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 08.03.21.
//
//

import Foundation
import CoreData


extension Homework {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Homework> {
        return NSFetchRequest<Homework>(entityName: "Homework")
    }

    @NSManaged public var title: String
    @NSManaged public var subject: String
    @NSManaged public var dueDate: Date
    @NSManaged public var comment: String
    
    @NSManaged public var notifyWeek: Bool
    @NSManaged public var notifyDay: Bool
    @NSManaged public var notifyHour: Bool

}

extension Homework : Identifiable {

}
