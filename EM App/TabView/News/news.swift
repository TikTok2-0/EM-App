//
//  news.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct news: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredNews: [NewsData] {
        modelData.newsData.filter { newsData in
            (!showFavoritesOnly || newsData.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    /*Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }*/
                    ForEach(ModelData().newsData, id: \.self) { newsData in
                        newsRow(newsData: newsData)
                    }
                    //.listRowBackground(Color.red)
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                }
                .listStyle(InsetListStyle())
                .padding()
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
                                Label("Corona", systemImage: "staroflife")
                            }
                            Button(action: {}) {
                                Label("Oberstufe", systemImage: "house.fill")
                            }
                            Button(action: {}) {
                                Label("Mittelstufe", systemImage: "house")
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
