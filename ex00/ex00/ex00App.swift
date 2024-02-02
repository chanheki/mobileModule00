//
//  ex00App.swift
//  ex00
//
//  Created by Chan on 2024/02/01.
//

import SwiftUI

@main
struct ex00App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
