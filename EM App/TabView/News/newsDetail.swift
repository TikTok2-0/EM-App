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
            VStack(alignment: .leading) {
                // DAS BILD MIT SCHATTEN AUF EINER KARTE, DIE SCHATTEN HAT
                // RESTLICHER TEXT IN EIN KARTE, DAS AUCH SCHATTEN HAT
                
                if colorScheme == .dark {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.black)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        
                        ImageView(withURL: newsData.imageURL)
                            .padding()
                    }
                }
                else if colorScheme == .light {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color(.white))
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        
                        ImageView(withURL: newsData.imageURL)
                            .padding()
                    }
                }
                
                
                
                if colorScheme == .dark {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).fill(Color.black)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        
                        VStack {
                            HStack {
                                Text(newsData.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                            
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
                }
                else if colorScheme == .light {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).fill(Color.white)
                            .shadow(color: Color("superiorGray"), radius: 3, x: 1, y: 3)
                        
                        VStack {
                            HStack {
                                Text(newsData.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                            
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
                }
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
