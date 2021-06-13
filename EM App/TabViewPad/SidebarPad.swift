//
//  SidebarPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI

struct SidebarPad: View {
    
    var body: some View {
        List {
            Section(header: Text("Dashboard")) {
                NavigationLink(destination: homePad()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: news()) {
                    Label("News", systemImage: "gear")
                }
                NavigationLink(destination: homeworkPlaner()) {
                    Label("Homework", systemImage: "gear")
                }
                NavigationLink(destination: gradeCalc()) {
                    Label("Abi Calc", systemImage: "gear")
                }
                NavigationLink(destination: gradeCalcMittelstufe()) {
                    Label("Grade Calc", systemImage: "gear")
                }
            }
            Section(header: Text("Other")) {
                NavigationLink(destination: profile()) {
                    Label("Profile", systemImage: "gear")
                }
                NavigationLink(destination: settings()) {
                    Label("Settings", systemImage: "gear")
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
