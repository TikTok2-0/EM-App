//
//  login.swift
//  EM App
//
//  Created by Henry Krieger on 19.01.21.
//

import SwiftUI

struct login: View {
    @State var showLoginView: Bool = false

    var body: some View {
        VStack {
            if showLoginView {
                MasterView()
                    //.animation(.spring())
                    .transition(.slide)
            } else {
                NavigationView {
                    VStack(alignment: .leading) {
                        Text("Hello")
                            .font(.largeTitle)
                        
                        Divider()
                            .frame(width: 100, height: 1, alignment: .leading)
                        
                        Button(action: { showLoginView.toggle() }, label: {
                            Text("Launch Beta")
                                .font(.title3)
                        })
                    }
                }
            }
        }
    }
}

struct MasterView: View {
    var body: some View {
        tabView()
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
