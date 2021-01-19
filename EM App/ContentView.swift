//
//  ContentView.swift
//  EM App
//
//  Created by Henry Krieger on 12.01.21.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    var body: some View {
        login()
    }
}

class SourceOfTruth: ObservableObject {
    @Published var count = 0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SourceOfTruth())
    }
}
