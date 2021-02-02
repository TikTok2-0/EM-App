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
    var id: Int
    var subLine: String
    var text: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case hg = "Hauptgebäude"
        case em = "Oberstufenhaus"
        case c19 = "Corona"
    }
    
    var features: [NewsData] {
        newsData.filter { $0.isFeatured }
    }
    
    private var imageTitle: String
    var image: Image {
        Image(imageTitle)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageTitle + "_feature") : nil
    }
}

