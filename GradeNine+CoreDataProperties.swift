//
//  GradeNine+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 19.05.21.
//
//

import Foundation
import CoreData


extension GradeNine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GradeNine> {
        return NSFetchRequest<GradeNine>(entityName: "GradeNine")
    }

    @NSManaged public var title: String
    @NSManaged public var grade: Int64

}

extension GradeNine : Identifiable {

}
