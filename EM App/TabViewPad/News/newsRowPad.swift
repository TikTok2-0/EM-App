//
//  newsRowPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI
import URLImage

struct newsRowPad: View {
    var newsData: NewsData
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0.4), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        HStack {
            NavigationLink(destination: newsDetail(newsData: newsData)) {
            }.hidden()
            
            RemoteImage(url: newsData.imageURL)
                .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/5, alignment: .leading)
                .aspectRatio(CGSize(width: 16.0, height: 9.0), contentMode: .fit)
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text(newsData.title)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                Text(newsData.dates)
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .padding()
        }
    }
}

struct newsRowPad_Previews: PreviewProvider {
    static var newsData = ArticlesFetcher().articles
    
    static var previews: some View {
        newsRowPad(newsData: newsData[0])
            //.environmentObject(ModelData())
    }
}
