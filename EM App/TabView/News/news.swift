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
                    ForEach(fetcher.articles, id: \.self) { newsData in
                        if colorScheme == .dark {
                            newsRow(newsData: newsData)
                                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        }
                        else if colorScheme == .light {
                            newsRow(newsData: newsData)
                                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .padding()
                }
                .listStyle(InsetListStyle())}
            .navigationTitle("News")
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: {  }) {
                                Label("All", systemImage: "rectangle.stack")
                            }
                        }
                        
                        Section {
                            Button(action: {  }) {
                                Label("HLG", systemImage: "house")
                            }
                            Button(action: {  }) {
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
