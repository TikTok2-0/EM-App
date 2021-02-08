//
//  newsDetail.swift
//  EM App
//
//  Created by Henry Krieger on 18.01.21.
//

import SwiftUI

struct newsDetail: View {
    @EnvironmentObject var modelData: ModelData
    var newsData: NewsData
    
    var body: some View {
        ScrollView {
            
            ImageView(withURL: newsData.imageURL)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(newsData.title)
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    Text(newsData.dates)
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
