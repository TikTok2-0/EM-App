//
//  ContentView.swift
//  EM App
//
//  Created by Henry Krieger on 12.01.21.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    //@EnvironmentObject var viewRouter: ViewRouter
        
    var body: some View {
        login()
        /*VStack {
            if viewRouter.currentPage == "onboardingView" {
                login()
            } else if viewRouter.currentPage == "homeView" {
                tabView()
            }
        }*/
    }
}
/*
class ViewRouter: ObservableObject {
    @Published var currentPage: String
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
