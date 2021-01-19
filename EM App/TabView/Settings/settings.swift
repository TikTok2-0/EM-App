//
//  settings.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct settings: View {
    @State private var selectedChar = userType.Student
    
    enum userType: String, CaseIterable, Codable {
        case Student
        case Teacher
        case Parent
        case Guest
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Flavor", selection: $selectedChar) {
                    Text("Student").tag(userType.Student)
                    Text("Teacher").tag(userType.Teacher)
                    Text("Parent").tag(userType.Parent)
                    Text("Guest").tag(userType.Guest)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
