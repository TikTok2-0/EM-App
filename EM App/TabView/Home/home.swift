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
                HStack {
                    Text("Start")
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                
                List {
                    Image("Logo")
                        //.border(Color.black, width: 1)
                    
                }
                .listStyle(InsetListStyle())
                
                HStack {
                    Text("Apps")
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                
                Spacer()
                
                List {
                    NavigationLink(destination: Text("Notenrechner")) {
                        Label("Notenrechner", systemImage: "function")
                    }
                    
                    NavigationLink(destination: Text("Untis")) {
                        Label("Vertretungsplan", systemImage: "message")
                    }
                }
                .listStyle(InsetListStyle())
            }
            .navigationTitle("Home")
            .padding()
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
