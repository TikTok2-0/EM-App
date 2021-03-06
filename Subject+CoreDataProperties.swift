//
//  Subject+CoreDataProperties.swift
//  EM App
//
//  Created by Henry Krieger on 05.03.21.
//
//

import Foundation
import CoreData


extension Subject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subject> {
        return NSFetchRequest<Subject>(entityName: "Subject")
    }

    @NSManaged public var title: String
    
    @NSManaged public var eA: Bool
    
    @NSManaged public var abitur: Int
    @NSManaged public var abiCheck: Bool
    
    @NSManaged public var s1: Int
    @NSManaged public var s2: Int
    @NSManaged public var s3: Int
    @NSManaged public var s4: Int

}

extension Subject : Identifiable {

}
