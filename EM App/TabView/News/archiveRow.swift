//
//  archiveRow.swift
//  EM App
//
//  Created by Henry Krieger on 11.02.21.
//

import SwiftUI
import URLImage

struct archiveRow: View {
    var archiveData: NewsData
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0.4), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationLink(destination: newsArchiveDetail(archiveData: archiveData)) {
            }.hidden()
            
            //ImageView(withURL: newsData.imageURL)
            
            RemoteImage(url: archiveData.imageURL)
            
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(archiveData.title)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                Text(archiveData.dates)
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .padding()
        }
        .foregroundColor(.white)
        .cornerRadius(15)
        .aspectRatio(CGSize(width: 3.6, height: 2), contentMode: .fill)
    }
}

struct archiveRow_Previews: PreviewProvider {
    static var archiveData = ModelData().archiveData
    
    static var previews: some View {
        newsRow(newsData: archiveData[0])
            //.environmentObject(ModelData())
    }
}
