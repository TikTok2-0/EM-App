//
//  profile.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI

struct profile: View {
    @State private var showPage: Bool = false
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Username")
                    Spacer()
                    Text("\(userSettings.username)")
                }
                HStack {
                    Text("Name")
                    Spacer()
                    Text("\(userSettings.firstName) \(userSettings.lastName)")
                }
                HStack {
                    Text("E-Mail")
                    Spacer()
                    Text("\(userSettings.email)")
                }
                HStack {
                    Text("Private Account")
                    Spacer()
                    Ellipse()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(userSettings.isPrivate ? .green : .red)
                }
                HStack {
                    Text("Notifications")
                    Spacer()
                    Ellipse()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(userSettings.prefersNotifications ? .green : .red)
                }
            }
            .navigationTitle("Profile")
            .listStyle(InsetListStyle())
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Label("", systemImage: "gear")
                        .font(.title3)
                }
            })
            .sheet(isPresented: $showPage, content: {
                settings()
            })
        }
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()
    }
}
