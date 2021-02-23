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
    @ObservedObject var fetcher = ArticlesFetcher()
    @State private var showUntis: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var gradeAverage: Double = 1.4
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: untisList()) {
                    Text("Timetable")
                        .foregroundColor(.primary)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                
                VStack {
                    ForEach(ModelData().untisData, id: \.self) { item in
                        untisRowPreview(untisData: item)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                    }
                }.padding(.bottom, 20)
                
                HStack {
                    Text("Hot Story 🔥")
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                    
                if colorScheme == .dark {
                    NavigationLink(destination: newsDetail(newsData: fetcher.articles[0])) {
                        hottestStory(newsData: fetcher.articles[0])
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                            .padding()
                    }
                }
                else if colorScheme == .light {
                    NavigationLink(destination: newsDetail(newsData: fetcher.articles[0])) {
                        hottestStory(newsData: fetcher.articles[0])
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                            .padding()
                    }
                }
                
                NavigationLink(destination: Text("soon")) {
                    Text("Grades")
                        .foregroundColor(.primary)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }
                
                NavigationLink(destination: gradeCalc()) {
                    Text("Schnitt: \(gradeAverage)")
                        .font(.title)
                }
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
                            Button(action: { showUntis.toggle() }) {
                                Label("Untis", systemImage: "")
                            }
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
            .sheet(isPresented: $showUntis, content: {
                untisList()
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
