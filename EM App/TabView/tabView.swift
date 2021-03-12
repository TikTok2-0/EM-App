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
        case homework
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            home()
                .tabItem {
                    Label("Home", systemImage: "house")                }
                .tag(Tab.home)
            news()
                .tabItem {
                    Label("News", systemImage: "tray")
                }
                .tag(Tab.news)
            homeworkPlaner()
                .tabItem {
                    Label("Homework", systemImage: "checkmark.square")
                }
                .tag(Tab.homework)
            profile()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(Tab.profile)
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        tabView()
            .environmentObject(modelData)
    }
}
