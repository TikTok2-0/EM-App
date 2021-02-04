//
//  NewsData.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import Foundation
import SwiftUI
import CoreLocation
import URLImage

struct NewsData: Hashable, Decodable, Identifiable {
    var title: String
    var caption: String
    var imageURL: String
    var id: Int
    var text: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case hg = "Hauptgebäude"
        case em = "Oberstufenhaus"
        case c19 = "Corona"
    }
    
    private var imageTitle: String
    var image: Image {
        Image(imageTitle)
    }
}

