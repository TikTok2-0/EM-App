//
//  NewsData.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import Foundation
import SwiftUI
import CoreLocation

struct NewsData: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var imageTitle: String
    var subLine: String
    var Text: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}

