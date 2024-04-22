//
//  workout_schedule_createApp.swift
//  workout_schedule_create
//
//  Created by Nene Wang  on 4/20/24.
//

import SwiftUI

@main
struct workout_schedule_createApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
