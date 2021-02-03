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
            newsData.image
                .resizable()
                //.frame(width: nil, height: 250, alignment: .top)
                .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fill)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(newsData.title)
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    Text(newsData.subLine)
                    //Spacer()
                    //Text(newsData.title)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(newsData.title)")
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
        newsDetail(newsData: ModelData().newsData[0])
            .environmentObject(modelData)
    }
}
