//
//  GradeSeven+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 19.05.21.
//
//

import Foundation
import CoreData


extension GradeSeven {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GradeSeven> {
        return NSFetchRequest<GradeSeven>(entityName: "GradeSeven")
    }

    @NSManaged public var title: String
    @NSManaged public var grade: Int64

}

extension GradeSeven : Identifiable {

}
