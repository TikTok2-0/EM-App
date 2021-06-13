//
//  SidebarPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI

struct SidebarPad: View {
    @State private var showSafari: Bool = false
    
    var body: some View {
        List {
            Section(header: Text("Dashboard")) {
                NavigationLink(destination: homePad()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: newsPad()) {
                    Label("News", systemImage: "tray")
                }
                NavigationLink(destination: Text("Untis coming soon")) {
                    Label("Untis", systemImage: "tablecells")
                }
                NavigationLink(destination: homeworkPlanerPad()) {
                    Label("Homework", systemImage: "checkmark.square")
                }
                NavigationLink(destination: gradeCalc()) {
                    Label("Abi Calc", systemImage: "function")
                }
                NavigationLink(destination: gradeCalcMittelstufe()) {
                    Label("Grade Calc", systemImage: "function")
                }
            }
            Section(header: Text("Other")) {
                NavigationLink(destination: profilePad()) {
                    Label("Profile", systemImage: "person.circle")
                }
                NavigationLink(destination: settingsPad()) {
                    Label("Settings", systemImage: "gear")
                }
            }
            Section(header: Text("Links")) {
                Button(action: { showSafari.toggle() }) {
                    Label("HLG Website", systemImage: "house").fullScreenCover(isPresented: $showSafari) {
                        SafariView(url: URL(string: "https://www.hlg-hamburg.de")!).ignoresSafeArea(edges: .all)
                    }
                }
                Button(action: { showSafari.toggle() }) {
                    Label("KFU Website", systemImage: "crown").fullScreenCover(isPresented: $showSafari) {
                        SafariView(url: URL(string: "https://www.kaifu-gymnasium.de")!).ignoresSafeArea(edges: .all)
                    }
                }
                Button(action: { showSafari.toggle() }) {
                    Label("Moodle", systemImage: "link").fullScreenCover(isPresented: $showSafari) {
                        SafariView(url: URL(string: "https://lms.lernen.hamburg")!).ignoresSafeArea(edges: .all)
                    }
                }
                Button(action: { showSafari.toggle() }) {
                    Label("itslearning", systemImage: "link").fullScreenCover(isPresented: $showSafari) {
                        SafariView(url: URL(string: "https://kaifu.itslearning.com")!).ignoresSafeArea(edges: .all)
                    }
                }
            }
        }.listStyle(SidebarListStyle())
        .navigationTitle("HLG-KAIFU App")
    }
}

struct SidebarPad_Previews: PreviewProvider {
    static var previews: some View {
        SidebarPad()
    }
}
