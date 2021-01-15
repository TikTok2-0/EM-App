//
//  home.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct home: View {
    @State private var showPage: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("")
            }
            .navigationTitle("Home")
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "gear")
                }
            })
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
