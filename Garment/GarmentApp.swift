//
//  GarmentApp.swift
//  Garment
//
//  Created by endOfLine on 7/24/21.
//

import SwiftUI

@main
struct GarmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
