//
//  settings.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct settings: View {
    @State private var showPage: Bool = false
    @State private var selectedFlavor = Flavor.Chocolate
    
    enum Flavor: String, CaseIterable, Codable {
        case Chocolate
        case Vanilla
        case Strawberry
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.Chocolate)
                    Text("Vanilla").tag(Flavor.Vanilla)
                    Text("Strawberry").tag(Flavor.Strawberry)
                }
                Spacer()
                Text("Selected flavor: \(selectedFlavor.rawValue)")
                Spacer()
            }
            .navigationTitle("Settings")
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "person.circle")
                }
            })
        }
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
