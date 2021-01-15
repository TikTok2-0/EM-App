//
//  news.swift
//  EM App
//
//  Created by Henry Krieger on 15.01.21.
//

import SwiftUI

struct news: View {
    @State private var showPage: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("")
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
