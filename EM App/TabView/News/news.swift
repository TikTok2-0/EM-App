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
                                .frame(width: nil, height: 150)
                                //.shadow(color: .red, radius: 5, x: 20, y: 20)
                            Rectangle().fill(gradient)
                            VStack(alignment: .leading) {
                                Text(item)
                                    .font(.title3)
                                    .bold()
                                Text(item)
                                    .font(.subheadline)
                            }
                            .padding()
                        }
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                    //.listRowBackground(Color.red)
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 15)
                }
            }
            .navigationTitle("News")
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "line.horizontal.3.circle")
                }
            })
            .sheet(isPresented: $showPage, content: {
                Text("Filters")
            })
        }
    }
}

struct news_Previews: PreviewProvider {
    static var previews: some View {
        news()
    }
}
