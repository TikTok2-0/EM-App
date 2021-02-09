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
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: Text("big rip")) {
                    Text("Stundenplan")
                        .foregroundColor(.primary)
                    Text("powered by Untis®")
                        .font(.caption2)
                        .foregroundColor(.accentColor)
                        .frame(width: nil, height: nil, alignment: .bottom)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                
                ForEach(ModelData().untisData, id: \.self) { item in
                    //Text("Hello")
                    untisRowPreview(untisData: item)
                }
                
                //Spacer()
                
                HStack {
                    Text("Hot Story 🔥")
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).fill(Color(.white))
                        .shadow(radius: 1, x: 0, y: 2)
                    
                    NavigationLink(destination: newsDetail(newsData: ModelData().newsData[0]) ) {
                        hottestStory(newsData: ModelData().newsData[0])
                            .padding()
                    }
                }.padding()
                
            }
            .navigationTitle("Hallo, \(userSettings.firstName)")
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
    static let modelData = ModelData()
    
    static var previews: some View {
        home()
            .environmentObject(modelData)
    }
}
