//
//  ContentView.swift
//  EM App
//
//  Created by Henry Krieger on 12.01.21.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case news
        case settings
    }

    var body: some View {
        TabView(selection: $selection) {
            home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            news()
                .tabItem {
                    Label("News", systemImage: "tray")
                }
                .tag(Tab.news)
            settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
