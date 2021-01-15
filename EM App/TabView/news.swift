//
//  news.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct news: View {
    @State private var showPage: Bool = false
    @State private var news = ["Austauschprogramm", "Corona", "MINT am HLG", "Moodle", "Grafiti"]
    
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
                        NavigationLink(destination: home()) {
                            ZStack(alignment: .bottomLeading) {
                                Image(item)
                                    .resizable()
                                    .frame(width: nil, height: 150)
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
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 10)
                }
            }
            .navigationTitle("News")
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "line.horizontal.3.circle")
                }
            })
        }
    }
}

struct news_Previews: PreviewProvider {
    static var previews: some View {
        news()
    }
}
