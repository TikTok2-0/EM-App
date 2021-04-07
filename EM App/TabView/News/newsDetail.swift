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
    
    @State var showSafari = false
    
    var body: some View {
        ScrollView {
            if newsData.id != "7" {
                RemoteImage(url: newsData.imageURL)
                    //.padding(.horizontal, -20)
                    .aspectRatio(CGSize(width: 3.6, height: 2), contentMode: .fit)
                    .ignoresSafeArea(edges: .top)
            }
            
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
                
                //ForEach(newsData.links, id: \.self) { link in
                    if newsData.links != "x" {
                        Button(action: { showSafari.toggle() }) {
                            Text("Link").fullScreenCover(isPresented: $showSafari) {
                                SafariView(url: URL(string: "\(newsData.links)")!).ignoresSafeArea(edges: .all)
                            }
                        }
                            //.padding(.vertical, 10)
                            //.font(.footnote)
                            //.foregroundColor(.secondary)
                    }
                //}
                
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
