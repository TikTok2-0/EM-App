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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            if colorScheme == .light {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        
                        ImageView(withURL: newsData.imageURL)
                            .padding()
                    }.padding()
                    
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        
                        VStack {
                            Text(newsData.title)
                                .font(.title2)
                            
                            //Text(newsData.text)
                            
                            HStack {
                                Text(newsData.dates)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(newsData.category.rawValue)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                        }.padding()
                    }.padding()
                }
            }
            else if colorScheme == .dark {
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct newsDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Group {
            newsDetail(newsData: ArticlesFetcher().articles[0])
            newsDetail(newsData: ArticlesFetcher().articles[1])
        }
        .environmentObject(modelData)
    }
}
