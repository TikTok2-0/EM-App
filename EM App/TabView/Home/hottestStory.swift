//
//  hottestStory.swift
//  EM App
//
//  Created by Henry Krieger on 09.02.21.
//

import SwiftUI

struct hottestStory: View {
    @ObservedObject var fetcher = ArticlesFetcher()
    
    @Environment(\.colorScheme) var colorScheme
    
    var newsData: NewsData
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0.4), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        if colorScheme == .dark{
            VStack{
                ZStack(alignment: .bottomLeading) {
                    RemoteImage(url: newsData.imageURL)
                }
                .foregroundColor(.white)
                .cornerRadius(15)
                .aspectRatio(CGSize(width: 3.6, height: 2), contentMode: .fill)
                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                
                
                VStack(alignment: .leading) {
                    Text(newsData.title)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                        .padding(.bottom, 2)
                        .padding(.top, 3)
                    Text(newsData.dates)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                .foregroundColor(.white)
                .padding(5)
            }
        }
        if colorScheme == .light{
            VStack{
                ZStack(alignment: .bottomLeading) {
                    RemoteImage(url: newsData.imageURL)
                }
                .foregroundColor(.white)
                .cornerRadius(15)
                .aspectRatio(CGSize(width: 3.6, height: 2), contentMode: .fill)
                .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                
                VStack(alignment: .leading) {
                    Text(newsData.title)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                        .padding(.bottom, 2)
                        .padding(.top, 3)
                    Text(newsData.dates)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                .foregroundColor(.black)
                .padding(5)
            }
        }
    }
}

struct hottestStory_Previews: PreviewProvider {
    static var newsData = ArticlesFetcher().articles
    
    static var previews: some View {
        hottestStory(newsData: newsData[5])
            //.environmentObject(ModelData())
    }
}


/*
 ZStack(alignment: .bottomLeading) {
     RemoteImage(url: newsData.imageURL)
     
     //Rectangle().fill(gradient)
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
 */
