//
//  ModelData.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var newsData: [NewsData] = load("newsData.json")
    
    var features: [NewsData] {
        newsData.filter { $0.isFeatured }
    }
    
    var categories: [String: [NewsData]] {
        Dictionary (
            grouping: newsData,
            by: { $0.category.rawValue }
        )
    }
}

var newsData: [NewsData] = load("newsData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couln't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couln't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couln't parse \(filename) as \(T.self):\n\(error)")
    }
}
