//
//  news.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI
import URLImage

struct news: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var fetcher = ArticlesFetcher()
    @State private var showFavoritesOnly = false
    @State private var showArchive = false
    
    @ObservedObject var userSettings = UserSettings()
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var schoolNews = UserSettings().school
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(fetcher.articles, id: \.self) { newsData in
                        if newsData.school == schoolNews {
                            newsRow(newsData: newsData)
                                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .padding()
                }
                .listStyle(InsetListStyle())}
            .navigationTitle("\(schoolNews) News")
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: {  }) {
                                Label("All", systemImage: "rectangle.stack")
                            }.disabled(true)
                        }
                        
                        Section {
                            Button(action: { schoolNews = "HLG" }) {
                                Label("HLG", systemImage: "house")
                            }
                            Button(action: { schoolNews = "KFU" }) {
                                Label("KaiFU", systemImage: "crown")
                            }
                        }
                    }
                    label: {
                        Label("Filters", systemImage: "slider.horizontal.3")
                            .font(.title3)
                    }
                }
            })
        }
    }
}



struct news_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        news()
            .environmentObject(modelData)
    }
}
