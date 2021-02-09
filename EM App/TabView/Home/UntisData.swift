//
//  UntisData.swift
//  EM App
//
//  Created by Henry Krieger on 09.02.21.
//

import Foundation
import SwiftUI
import CoreLocation

struct UntisData: Hashable, Decodable {
    var subject: String
    var room: String
    var teacher: String
    var cover: String
    var id: String
    
    
    struct color: Codable {
        var red: CGFloat
        var green: CGFloat
        var blue: CGFloat
        var alpha: CGFloat?

        var uiColor: UIColor {
            return UIColor(red: red, green: green, blue: blue, alpha: alpha ?? 1)
        }
    }
}
