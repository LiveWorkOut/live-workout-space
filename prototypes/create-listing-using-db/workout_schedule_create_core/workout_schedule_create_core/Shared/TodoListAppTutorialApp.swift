
import SwiftUI

//@main
struct TodoListAppTutorialApp: App{
    let persistenceController = PersistenceController.shared
    
    
    
    var body: some Scene{
        WindowGroup {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            WorkoutListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}


