//
//  tabView.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI

struct tabView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case news
        case profile
        case testingArea
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
            profile()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(Tab.profile)
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
    }
}
