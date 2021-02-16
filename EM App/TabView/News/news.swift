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
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(fetcher.articles, id: \.self) { newsData in
                        if colorScheme == .dark {
                            ZStack{
                                RoundedRectangle (cornerSize: CGSize(width: 20, height:20)).fill(Color("superiorCardColor"))
                                    .shadow(color: Color("superiorWhiteCardShadow"), radius: 3, x: 1, y: 3)
                                
                                newsRow(newsData: newsData)
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                    .padding(12)
                            }
                        }
                        else if colorScheme == .light {
                            ZStack{
                                RoundedRectangle (cornerSize: CGSize(width: 20, height:20)).fill(Color("superiorCardColor"))
                                    .shadow(color: Color("superiorWhiteCardShadow"), radius: 3, x: 1, y: 3)
                                
                                newsRow(newsData: newsData)
                                    .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                                    .padding(12)
                            }
                        }
                    }
                    
                    
                    .listRowInsets(EdgeInsets())
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                }
                .listStyle(InsetListStyle())
                .padding(15)
            }
            .navigationTitle("News")
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: {}) {
                                Label("All", systemImage: "rectangle.stack")
                            }
                        }
                        
                        Section {
                            Button(action: {}) {
                                Label("Allgemein", systemImage: "gearshape")
                            }
                            Button(action: {}) {
                                Label("Deutsch", systemImage: "textformat.abc")
                            }
                            Button(action: {}) {
                                Label("Beobachtungsstufe", systemImage: "dot.radiowaves.left.and.right")
                            }
                            Button(action: {}) {
                                Label("UNESCO", systemImage: "leaf.fill")
                            }
                        }
                        
                        Section {
                            Button(action: {}) {
                                Label("2021", systemImage: "21.square")
                            }
                            Button(action: {}) {
                                Label("2020", systemImage: "20.square")
                            }
                            Button(action: {}) {
                                Label("2019", systemImage: "19.square")
                            }
                        }
                        
                        Section {
                            Button(action: { showArchive.toggle() }) {
                                Label("Archive", systemImage: "archivebox")
                            }
                        }
                    }
                    label: {
                        Label("Filters", systemImage: "slider.horizontal.3")
                            .font(.title3)
                    }
                }
            })
            .sheet(isPresented: $showArchive, content: {
                newsArchive()
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
