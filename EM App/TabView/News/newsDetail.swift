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
        VStack {
            newsData.image
                .resizable()
                .frame(width: nil, height: 250, alignment: .top)
            Text(newsData.title)
                .font(.title)
            
        }
    }
}

struct newsDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        newsDetail(newsData: ModelData().newsData[0])
            .environmentObject(modelData)
    }
}
