//
//  __year_ios_hw1App.swift
//  3_year_ios_hw1
//
//  Created by Карим Хамид on 04.02.2024.
//

import SwiftUI

@main
struct __year_ios_hw1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
