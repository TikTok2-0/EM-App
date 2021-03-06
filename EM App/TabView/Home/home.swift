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
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Subject.entity(), sortDescriptors: [])
    var subject: FetchedResults<Subject>
    
    var sumS1: Int {
        subject.reduce(0) { $0 + $1.s1 }
    }
    var sumS2: Int {
        subject.reduce(0) { $0 + $1.s2 }
    }
    var sumS3: Int {
        subject.reduce(0) { $0 + $1.s3 }
    }
    var sumS4: Int {
        subject.reduce(0) { $0 + $1.s4 }
    }
    var sumAbi: Int {
        subject.reduce(0) { $0 + $1.abitur }
    }
    
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
                        Text("\((17 / 3) - Double(sumS1 + sumS2 + sumS3 + sumS4 + (sumAbi * 5)) / 180)")
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
