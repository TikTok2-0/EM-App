//
//  ModelData.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var newsData: [NewsData] = load("jsonExports.json")
    @Published var archiveData: [NewsData] = load("jsonArchive.json")
    @Published var untisData: [UntisData] = load("untisData.json")
    
    var categories: [String: [NewsData]] {
        Dictionary (
            grouping: newsData,
            by: { $0.category.rawValue }
        )
    }
}

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}


var newsData: [NewsData] = load("jsonExports.json")
var untisData: [UntisData] = load("untisData.json")

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
