//
//  newsPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI
import URLImage

struct newsPad: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var fetcher = ArticlesFetcher()
    @State private var showFavoritesOnly = false
    @State private var showArchive = false
    
    @ObservedObject var userSettings = UserSettings()
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var schoolNews = UserSettings().school
    
    var body: some View {
        VStack {
            List {
                ForEach(fetcher.articles, id: \.self) { newsData in
                    if newsData.school == schoolNews {
                        newsRowPad(newsData: newsData)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                    }
                    else if schoolNews == "" {
                        newsRowPad(newsData: newsData)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                    }
                }
                .listRowInsets(EdgeInsets())
                .padding()
            }
            .listStyle(InsetListStyle())}
        .navigationTitle("\(schoolNews) News")
            .navigationBarItems(trailing:
                Menu {
                    Section {
                        Button(action: { schoolNews = "" }) {
                            Label("All", systemImage: "rectangle.stack")
                        }
                    }
                    Section {
                        Button(action: { schoolNews = "HLG" }) {
                            Label("HLG", systemImage: "house")
                        }
                        Button(action: { schoolNews = "KFU" }) {
                            Label("KFU", systemImage: "crown")
                        }
                    }
                }
                label: {
                    //Label("Filters", systemImage: "slider.horizontal.3")
                        //.font(.title3)
                    Image(systemName: "slider.horizontal.3")
                        .imageScale(.large)
                }
            )
    }
}



struct newsPad_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        newsPad()
            .environmentObject(modelData)
    }
}
