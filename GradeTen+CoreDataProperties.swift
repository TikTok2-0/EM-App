//
//  GradeTen+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 19.05.21.
//
//

import Foundation
import CoreData


extension GradeTen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GradeTen> {
        return NSFetchRequest<GradeTen>(entityName: "GradeTen")
    }

    @NSManaged public var title: String
    @NSManaged public var grade: Int64

}

extension GradeTen : Identifiable {

}
