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
    
    //@State var showNews = "KFU"    .filter { $0.school == showNews }
    
    /*private func setReaction(_ school: String, for item: ) {
        if let index = self.fetcher.articles.firstIndex(
            where: { $0.id ==  }) {
            fetcher.articles[index].school = school
        }
    }*/
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("\(userSettings.school)")) {
                        ForEach(fetcher.articles, id: \.self) { newsData in
                            if newsData.school == userSettings.school {
                                newsRow(newsData: newsData)
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        .padding()
                    }
                    /*Section(header: Text("KFU")) {
                        ForEach(fetcher.articles, id: \.self) { newsData in
                            if newsData.school == "KFU" {
                                newsRow(newsData: newsData)
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        .padding()
                    }*/
                }
                .listStyle(InsetGroupedListStyle())}
            .navigationTitle("News")
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: {  }) {
                                Label("All", systemImage: "rectangle.stack")
                            }.disabled(true)
                        }
                        
                        Section {
                            Button(action: { userSettings.school = "HLG" }) {
                                Label("HLG", systemImage: "house")
                            }
                            Button(action: { userSettings.school = "KFU" }) {
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
