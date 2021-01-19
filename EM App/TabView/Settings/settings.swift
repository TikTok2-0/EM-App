//
//  settings.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct settings: View {
    @State private var showPage: Bool = false
    @State private var selectedFlavor = Flavor.Student
    
    enum Flavor: String, CaseIterable, Codable {
        case Student
        case Teacher
        case Parent
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Student").tag(Flavor.Student)
                    Text("Teacher").tag(Flavor.Teacher)
                    Text("Parent").tag(Flavor.Parent)
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
            .sheet(isPresented: $showPage, content: {
                //Show filters
            })
        }
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
