//
//  NewsData.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import Foundation
import SwiftUI
import CoreLocation

struct NewsData: Hashable, Decodable, Identifiable {    
    var title: String
    var caption: String
    var imageURL: String
    var id: String
    var dates: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case Allgemein = "Allgemein"
        case Beobachtungsstufe = "Beobachtungsstufe"
        case Deutsch = "Deutsch"
    }
    
    var text: String
}
