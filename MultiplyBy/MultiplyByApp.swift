//
//  MultiplyByApp.swift
//  MultiplyBy
//
//  Created by megared on 30/05/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import SwiftUI

@main
struct MultiplyByApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var game = GameViewModel()
    @StateObject var appState = AppState()
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active:
                        print(">> your code is here on scene become active")
                    case .inactive:
                        print(">> your code is here on become inactive")
                    case .background:
                        // FIXME: - Still needed ?
                        // (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                        print(">> your code is here on go in background")
                    default:
                        print(">> do something else in future")
                    }
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(game)
                .environmentObject(appState)
                .statusBar(hidden: true)
        }
    }
}
