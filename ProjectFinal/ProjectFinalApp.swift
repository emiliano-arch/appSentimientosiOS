//
//  ProjectFinalApp.swift
//  ProjectFinal
//
//  Created by Emiliano Medina on 06/05/23.
//

import SwiftUI

@main
struct ProjectFinalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
