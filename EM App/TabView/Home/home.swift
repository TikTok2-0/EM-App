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
            VStack(alignment: .leading) {
                Image("Logo")
                    .border(Color.black, width: 1)
                Spacer()
            }
            .navigationTitle("Home")
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "bell")
                }
                .frame(alignment: .trailing)
            })
            .sheet(isPresented: $showPage, content: {
                Text("Notifications")
            })
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
