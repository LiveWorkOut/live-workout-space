//
//  ContentView.swift
//  workout_schedule_create_core
//
//  Created by Nene Wang  on 4/20/24.
//

import SwiftUI
import CoreData


struct WorkouItemDraft: Identifiable {
    var id: ObjectIdentifier
    
        var uuid = UUID()
        var name = ""
        var count = 0
        var value = 0
}

struct WorkoutListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \WorkoutSchedule.timestamp, ascending: true)],
        animation: .default)
//    private var items: FetchedResults<Item>
    private var workoutSchedules: FetchedResults<WorkoutSchedule>
    private var fetchedResults: FetchedResults<Workout>
    
    private var workouts: [WorkouItemDraft] = [
        WorkouItemDraft(id: ObjectIdentifier(UUID() as AnyObject), name: "Pushups", count: 10, value: 10),
        WorkouItemDraft(id: ObjectIdentifier(UUID() as AnyObject), name: "Situps", count: 10, value: 10),
    ]



    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    List {
//                        ForEach(items) { item in
//                            NavigationLink {
//                                Text("Item at \(item.name ?? "" )")
//                            } label: {
//                                Text(item.name ?? "")
//                            }
//                        }
                        ForEach(workoutSchedules) { session in
                            NavigationLink {
                                if let endTime = session.endtime {
                                    Text("Last Session ended at \(formatDate(endTime))")
                                } else {
                                    Text("Session not available yet.")
                                }
                                ForEach(workouts) { workoutItem in
                                    Text("Workout: \(workoutItem.name), Count: \(workoutItem.count), Value: \(workoutItem.value)")
                                }
                            } label: {
                                Text(session.name ?? "")
                            }
                        }


                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        // ToolbarItem {
                        //     Button(action: addItem) {
                        //         Label("Add Item", systemImage: "plus")
                        //     }
                        // }
                    }
                    
                    FloatingButton().environmentObject(dateHolder)
                }
            }.navigationTitle("Schedule Workout")

        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func addWorkoutSchedule() {
        withAnimation {
            let newWorkoutSchedule = WorkoutSchedule(context: viewContext)
            newWorkoutSchedule.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { workoutSchedules[$0] }.forEach(viewContext.delete)
            dateHolder.saveContext(viewContext)
            
            
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//#Preview {
//    WorkoutListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
