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
                    if phase == .background {
                        persistenceController.save()
                    }
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(game)
                .environmentObject(appState)
                .statusBar(hidden: true)
        }
    }
}
