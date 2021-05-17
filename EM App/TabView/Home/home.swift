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
    @FetchRequest(entity: Grade.entity(), sortDescriptors: [])
    var grade: FetchedResults<Grade>
    
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
    
    var sum5: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum6: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum7: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum8: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum9: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    var sum10: Int64 {
        grade.reduce(0) { $0 + $1.grade }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                /*NavigationLink(destination: untisList()) {
                    Text("Timetable")
                        .foregroundColor(.primary)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }.padding(.horizontal, 20)*/
                Button(action: { showUntis.toggle() }) {
                    Text("Timetable")
                        .foregroundColor(.primary)
                    VStack {
                        Divider()
                            .background(Color.primary)
                    }
                }.disabled(true)
                .padding(.horizontal, 20)
                .sheet(isPresented: $showUntis) {
                    untisList()
                }
                
                VStack {
                    Text("Coming in July 2021")
                    ForEach(ModelData().untisData, id: \.self) { item in
                        if colorScheme == .light {
                            untisRowPreview(untisData: item)
                                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        } else if colorScheme == .dark {
                            untisRowPreview(untisData: item)
                        }
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
                        Text("Abitur Average")
                        Spacer()
                        let x = (17 / 3) - Double(sumS1 + sumS2 + sumS3 + sumS4 + (sumAbi * 5)) / 180
                        Text("\(  Double(round(1000*x)/1000), specifier: "%.2f"  )")
                    }.font(.title)
                }.padding(.horizontal, 20)
                /*NavigationLink(destination: gradeCalcMittelstufe()) {
                    VStack {
                        let c = grade.count
                        Text("TEST: \(c)")
                        HStack {
                            Text("10. Average")
                            Spacer()
                            Text("\(sum10)")
                        }.font(.title)
                        HStack {
                            Text("9. Average")
                            Spacer()
                            Text("\(sum9)")
                        }.font(.title)
                        HStack {
                            Text("8. Average")
                            Spacer()
                            Text("\(sum8)")
                        }.font(.title)
                        HStack {
                            Text("7. Average")
                            Spacer()
                            Text("\(sum7)")
                        }.font(.title)
                        HStack {
                            Text("6. Average")
                            Spacer()
                            Text("\(sum6)")
                        }.font(.title)
                        HStack {
                            Text("5. Average")
                            Spacer()
                            Text("\(sum5)")
                        }.font(.title)
                    }
                }.padding(.horizontal, 20)*/
                .padding(.bottom, 20)
            }
            .navigationTitle("Hello, \(userSettings.firstName)")
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
