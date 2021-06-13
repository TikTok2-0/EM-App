//
//  tabViewPad.swift
//  EM App
//
//  Created by Henry Krieger on 13.06.21.
//

import SwiftUI

struct tabViewPad: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case news
        case homework
        case profile
    }
    
    var body: some View {
        NavigationView {
            SidebarPad()
            //homePad()
        }
    }
}

struct tabViewPad_Previews: PreviewProvider {
    static var previews: some View {
        tabViewPad()
    }
}
