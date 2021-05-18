//
//  GradeEight+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 19.05.21.
//
//

import Foundation
import CoreData


extension GradeEight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GradeEight> {
        return NSFetchRequest<GradeEight>(entityName: "GradeEight")
    }

    @NSManaged public var title: String
    @NSManaged public var grade: Int64

}

extension GradeEight : Identifiable {

}
