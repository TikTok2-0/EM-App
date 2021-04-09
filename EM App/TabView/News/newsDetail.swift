//
//  newsDetail.swift
//  EM App
//
//  Created by Henry Krieger on 18.01.21.
//

import SwiftUI
import AVKit

struct newsDetail: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var fetcher = ArticlesFetcher()
    var newsData: NewsData
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var showSafari = false
    
    var body: some View {
        ScrollView {
            
            RemoteImage(url: newsData.imageURL)
                //.padding(.horizontal, -20)
                .aspectRatio(contentMode: .fit) //CGSize(width: 3.6, height: 2),
                //.aspectRatio(contentMode: .fit)
                .ignoresSafeArea(edges: .top)
            
            VStack(alignment: .leading) {
                Text(newsData.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(newsData.text)
                    /*.contextMenu {
                        Button(action: {
                            UIPasteboard.general.string = newsData.text
                        }) {
                            Text("Copy to clipboard")
                            Image(systemName: "doc.on.doc")
                        }
                    }*/
                
                Spacer()
                
                if newsData.links != "x" {
                    Button(action: { showSafari.toggle() }) {
                        Text("Link").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "\(newsData.links)")!).ignoresSafeArea(edges: .all)
                        }
                    }
                }
                
                /*if newsData.videos != "x" {
                    Button(action: { showSafari.toggle() }) {
                        Text("Video").fullScreenCover(isPresented: $showSafari) {
                            SafariView(url: URL(string: "\(newsData.videos)")!).ignoresSafeArea(edges: .all)
                        }
                    }
                }*/
                
                if newsData.videos != "x" && URL(string: "\(newsData.videos)") != nil {
                    VideoPlayer(player: AVPlayer(url:  URL(string: "\(newsData.videos)")!))
                        .aspectRatio(contentMode: .fill)
                        //.frame(width: 400, height: 300)
                }
                
                Spacer()
                
                HStack {
                    Text(newsData.dates)
                    Spacer()
                    Text(newsData.category)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }.padding()
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


/*
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
 */
