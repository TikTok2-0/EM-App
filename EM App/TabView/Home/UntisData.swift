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
    var color: String
    var cover: String
    var id: String
}
