//
//  GradeSix+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 19.05.21.
//
//

import Foundation
import CoreData


extension GradeSix {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GradeSix> {
        return NSFetchRequest<GradeSix>(entityName: "GradeSix")
    }

    @NSManaged public var grade: Int64
    @NSManaged public var title: String

}

extension GradeSix : Identifiable {

}
