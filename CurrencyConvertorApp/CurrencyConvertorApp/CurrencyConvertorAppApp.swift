//
//  CurrencyConvertorAppApp.swift
//  CurrencyConvertorApp
//
//  Created by Neelesh Rai on 21/08/22.
//

import SwiftUI

@main
struct CurrencyConvertorAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
            Home()
                .navigationTitle("Currency Exchange")
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
