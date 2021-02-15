//
//  newsDetail.swift
//  EM App
//
//  Created by Henry Krieger on 18.01.21.
//

import SwiftUI

struct newsDetail: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var fetcher = ArticlesFetcher()
    var newsData: NewsData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(newsData.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                ImageView(withURL: newsData.imageURL)
                    .padding(.leading, -20)
                    .padding(.trailing, -20)
                
                HStack {
                    Text(newsData.dates)
                    Spacer()
                    Text(newsData.category.rawValue)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(newsData.text)
            }
            .padding()
        }
        //.navigationTitle(newsData.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct newsDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Group {
            newsDetail(newsData: ArticlesFetcher().articles[0])
            newsDetail(newsData: ArticlesFetcher().articles[1])
            //newsDetail(newsData: ModelData().newsData[2])
        }
            .environmentObject(modelData)
    }
}
