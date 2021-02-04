//
//  newsDetail.swift
//  EM App
//
//  Created by Henry Krieger on 18.01.21.
//

import SwiftUI
import URLImage

struct newsDetail: View {
    @EnvironmentObject var modelData: ModelData
    var newsData: NewsData
    
    var body: some View {
        ScrollView {
            
            /*
            URLImage(url: URL(string: newsData.imageURL)!) { image in
                image
                    .resizable()
                    .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fill)
            }
            
            Divider()
            */
            
            newsData.image
                .resizable()
                .frame(width: nil, height: 250, alignment: .top)
                //.aspectRatio(CGSize(width: 16, height: 9), contentMode: .fill)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(newsData.title)
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    Text(newsData.caption)
                    //Spacer()
                    //Text(newsData.title)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Info:")
                    .font(.title2)
                Text(newsData.text)
            }
            .padding()
        }
        .navigationTitle(newsData.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct newsDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Group {
            newsDetail(newsData: ModelData().newsData[0])
            newsDetail(newsData: ModelData().newsData[1])
            //newsDetail(newsData: ModelData().newsData[2])
        }
            .environmentObject(modelData)
    }
}
