//
//  untisRowPreview.swift
//  EM App
//
//  Created by Henry Krieger on 09.02.21.
//

import SwiftUI

struct untisRowPreview: View {
    var untisData: UntisData
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).fill(Color(untisData.cover))
                .frame(width: nil, height: 60, alignment: .center)
                .clipped()
                .shadow(radius: 1, x: 0, y: 2)
            if untisData.cover == "ausfall" {
                HStack {
                    Ellipse()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(Color(untisData.color))
                    Text(untisData.subject).strikethrough()
                        .frame(width: 120, alignment: .leading)
                    Spacer()
                    Spacer()
                    Text(untisData.room).strikethrough()
                        .frame(width: 50, alignment: .leading)
                    Spacer()
                    Text(untisData.teacher).strikethrough()
                        .frame(width: 30, alignment: .trailing)
                }.padding()
            } else {
                HStack {
                    Ellipse()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(Color(untisData.color))
                    Text(untisData.subject)
                        .frame(width: 120, alignment: .leading)
                    Spacer()
                    Spacer()
                    Text(untisData.room)
                        .frame(width: 50, alignment: .leading)
                    Spacer()
                    Text(untisData.teacher)
                        .frame(width: 30, alignment: .trailing)
                }.padding()
            }
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
