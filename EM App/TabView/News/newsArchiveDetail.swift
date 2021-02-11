//
//  newsArchiveDetail.swift
//  EM App
//
//  Created by Henry Krieger on 11.02.21.
//

import SwiftUI

struct newsArchiveDetail: View {
    @EnvironmentObject var modelData: ModelData
    var archiveData: NewsData
    
    var body: some View {
        ScrollView {
            
            ImageView(withURL: archiveData.imageURL)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(archiveData.title)
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    Text(archiveData.dates)
                    Spacer()
                    Text(archiveData.category.rawValue)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Info:")
                    .font(.title2)
                Text(archiveData.text)
            }
            .padding()
        }
        .navigationTitle(archiveData.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct newsArchiveDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Group {
            newsArchiveDetail(archiveData: ModelData().archiveData[0])
            newsArchiveDetail(archiveData: ModelData().archiveData[1])
            //newsDetail(newsData: ModelData().newsData[2])
        }
            .environmentObject(modelData)
    }
}
