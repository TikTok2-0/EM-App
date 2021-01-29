//
//  profile.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI

struct profile: View {
    @State private var showPage: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                Spacer()
                
                Spacer()
                //Text("\(selectedFlavor.rawValue)")
                    .font(.title)
                Spacer()
            }
            .navigationTitle("Profile")
            .toolbar(content: {
                Button(action: { showPage.toggle() }) {
                    Image(systemName: "gear")
                }
            })
            .sheet(isPresented: $showPage, content: {
                settings()
            })
        }
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()
            .environmentObject(SourceOfTruth())
    }
}
