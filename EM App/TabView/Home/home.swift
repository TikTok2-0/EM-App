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
    @State private var showGradecalc: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var gradeAverage: Double = 1.4
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: untisList()) {
                    Text("Timetable")
                        .foregroundColor(.primary)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }.padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack {
                    ForEach(ModelData().untisData, id: \.self) { item in
                        untisRowPreview(untisData: item)
                            //.padding(.leading, 20)
                            //.padding(.trailing, 20)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                    }
                }.padding()//.bottom, 20)
                
                HStack {
                    Text("Hot Story 🔥")
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }.padding(.leading, 20)
                .padding(.trailing, 20)
                
                ForEach(fetcher.articles, id: \.self) { newsData in
                    if newsData.id == "1" {
                        NavigationLink(destination: newsDetail(newsData: fetcher.articles[0])) {
                            hottestStory(newsData: fetcher.articles[0])
                                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                .padding()
                        }
                    }
                }
                
                NavigationLink(destination: gradeCalc()) {
                    Text("Grades")
                        .foregroundColor(.primary)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }.padding(.leading, 20)
                .padding(.trailing, 20)
                
                NavigationLink(destination: gradeCalc()) {
                    HStack {
                        Text("Schnitt")
                        Spacer()
                        Text("\(String(gradeAverage))")
                    }.font(.title)
                }.padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 20)
            }
            .navigationTitle("Hallo, \(userSettings.firstName)")
            //.padding()
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: { showPage.toggle() }) {
                                Label("Notifications", systemImage: "bell")
                            }
                        }
                        Section(header: Text("Apps")) {
                            Button(action: { showUntis.toggle() }) {
                                Label("Untis (soon)", systemImage: "")
                            }
                            
                            Button(action: { showGradecalc.toggle() }) {
                                Label("Grade Calc (soon)", systemImage: "formula")
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
