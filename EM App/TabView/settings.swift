//
//  settings.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct settings: View {
    @State private var showPage: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("")
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
