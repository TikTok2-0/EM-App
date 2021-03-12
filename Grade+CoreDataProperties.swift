//
//  Grade+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 12.03.21.
//
//

import Foundation
import CoreData


extension Grade {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Grade> {
        return NSFetchRequest<Grade>(entityName: "Grade")
    }

    @NSManaged public var title: String
    @NSManaged public var grade: Int64
    @NSManaged public var year: Int64

}

extension Grade : Identifiable {

}
