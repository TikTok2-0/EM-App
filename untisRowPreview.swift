//
//  untisRowPreview.swift
//  EM App
//
//  Created by Henry Krieger on 09.02.21.
//

import SwiftUI

struct untisRowPreview: View {
    var untisData: UntisData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).fill(Color(UIColor.systemBackground))
                .frame(width: nil, height: 60, alignment: .center)
                .clipped()
                .border(Color.gray, width: 1)
                .shadow(radius: 1, x: 0, y: 2)
            HStack {
                Ellipse()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(.red)
                Text(untisData.subject)
                    .frame(width: 120, alignment: .leading)
                Spacer()
                Spacer()
                Text(untisData.room)
                    .frame(width: 50, alignment: .leading)
                Spacer()
                Text(untisData.teacher)
            }.padding()
        }
        .cornerRadius(15)
        .aspectRatio(CGSize(width: 3.6, height: 2), contentMode: .fill)
    }
}

struct untisRowPreview_Previews: PreviewProvider {
    static var untisData = ModelData().untisData
    
    static var previews: some View {
        untisRowPreview(untisData: untisData[0])
    }
}


/*
 
 */
