//
//  newsArchive.swift
//  EM App
//
//  Created by Henry Krieger on 11.02.21.
//

import SwiftUI

struct newsArchive: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        List {
            ForEach(ModelData().archiveData, id: \.self) { archiveData in
                archiveRow(archiveData: archiveData)
            }
            //.listRowBackground(Color.red)
            .listRowInsets(EdgeInsets())
            .padding(.bottom, 10)
            .padding(.top, 10)
        }
        .listStyle(InsetListStyle())
        .padding()
    }
}

struct newsArchive_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        newsArchive()
            .environmentObject(modelData)
    }
}
