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
    var category: String
    var text: String
    var school: String
    
    var links: String?
}
