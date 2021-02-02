//
//  news.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct news: View {
    @State private var showPage: Bool = false
    @State private var news = ["Austauschprogramm", "Corona", "MINT am HLG", "Moodle", "Graffiti", "'It is easier to criticize than to praise.'", "Ballade meets Lego", "Anmeldung für die neuen fünften Klassen"]
    
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0.4), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(news.reversed(), id: \.self) { item in
                        ZStack(alignment: .bottomLeading) {
                            NavigationLink(destination: newsDetail()) {
                            }.hidden()
                            Image(item)
                                .resizable()
                                .frame(width: nil, height: 250)
                            Rectangle().fill(gradient)
                            VStack(alignment: .leading) {
                                Text(item)
                                    .font(.title3)
                                    .bold()
                                    .lineLimit(1)
                                Text(item)
                                    .font(.subheadline)
                                    .lineLimit(1)
                            }
                            .padding()
                        }
                        .foregroundColor(.white)
                        .cornerRadius(15)
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
            /*.sheet(isPresented: $showPage, content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "line.horizontal.3.circle")
                }
            })*/
        }
    }
}

struct news_Previews: PreviewProvider {
    static var previews: some View {
        news()
    }
}
