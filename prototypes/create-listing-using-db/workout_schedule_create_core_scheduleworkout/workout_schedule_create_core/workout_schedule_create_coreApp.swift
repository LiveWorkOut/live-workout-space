//
//  workout_schedule_create_coreApp.swift
//  workout_schedule_create_core
//
//  Created by Nene Wang  on 4/20/24.
//

import SwiftUI

@main
struct workout_schedule_create_coreApp: App {
    let persistenceController = PersistenceController.shared
    
    
    
    var body: some Scene{
        WindowGroup {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}
