//
//  newsRow.swift
//  EM App
//
//  Created by Henry Krieger on 02.02.21.
//

import SwiftUI
import URLImage

struct newsRow: View {
    var newsData: NewsData
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0.4), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationLink(destination: newsDetail(newsData: newsData)) {
            }.hidden()
            
            //ImageView(withURL: newsData.imageURL)
            
            RemoteImage(url: newsData.imageURL)
            
            Rectangle().fill(gradient)
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
        .foregroundColor(.white)
        .cornerRadius(15)
        .aspectRatio(CGSize(width: 3.6, height: 2), contentMode: .fill)
    }
}

struct newsRow_Previews: PreviewProvider {
    static var newsData = ArticlesFetcher().articles
    
    static var previews: some View {
        newsRow(newsData: newsData[0])
            //.environmentObject(ModelData())
    }
}
