//
//  HomeworkData.swift
//  EM App
//
//  Created by Henry Krieger on 10.05.21.
//

import Foundation

struct HomeworkData: Hashable, Decodable {
    var title: String
    var date: Date
    var subject: String
    var comment: String
}
