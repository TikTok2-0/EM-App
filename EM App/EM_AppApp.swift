//
//  EM_AppApp.swift
//  EM App
//
//  Created by Henry Krieger on 12.01.21.
//

import SwiftUI

@main
struct EM_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear(perform: ArticlesFetcher().load)
        }
    }
}
