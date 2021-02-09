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
    @State private var showFavoritesOnly = false
    @State private var showArchive = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
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
                                Label("Allgemein", systemImage: "gearshape")
                            }
                            Button(action: {}) {
                                Label("Deutsch", systemImage: "textformat.abc")
                            }
                            Button(action: {}) {
                                Label("Beobachtungsstufe", systemImage: "dot.radiowaves.left.and.right")
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
                Text("Archive coming in V1")
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
