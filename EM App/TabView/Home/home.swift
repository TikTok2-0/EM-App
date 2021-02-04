//
//  home.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI
import URLImage

struct home: View {
    @State private var showPage: Bool = false
    @ObservedObject var userSettings = UserSettings()
    
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
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: { showPage.toggle() }) {
                                Label("Notifications", systemImage: "bell")
                            }
                        }
                        Section(header: Text("Apps")) {
                            Text("Notenrechner (coming soon)")
                            Text("Vertretungsplan (coming soon)")
                        }
                        Section {
                            Button(action: { userSettings.firstLogin.toggle() }) {
                                Label("Logout", systemImage: "person.crop.circle.badge.xmark")
                                    //.foregroundColor(.red)
                            }
                        }
                    }
                    label: {
                        Label("Menu", systemImage: "line.horizontal.3")
                            .font(.title3)
                    }
                }
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
