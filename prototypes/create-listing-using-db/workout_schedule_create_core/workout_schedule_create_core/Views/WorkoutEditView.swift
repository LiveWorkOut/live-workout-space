//
//  TaskEditView.swift
//  workout_schedule_create_core
//
//  Created by Nene Wang on 4/21/24.
//

import Foundation
import SwiftUI


struct WorkouItemtDraft: Identifiable {
        var id = UUID()
        var name = ""
        var count = 0
        var value = 0
}

struct WorkoutEditView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
//    @State var selectedTaskItem: Item?
    @State var workoutSchedule: WorkoutSchedule?
    
    
    @State var name: String
    @State var desc: String
    
    @State var isPublic: Bool
    @State var saveAsVideo: Bool
    @State var setAsRecurrent: Bool

    // Monday to friday
    @State var monday: Bool
    @State var tuesday: Bool
    @State var wednesday: Bool
    @State var thursday: Bool
    @State var friday: Bool
    @State var saturday: Bool
    @State var sunday: Bool


    @State var startTime = Date()
    @State var endTime = Date()
    
    
    // sampleWorkout.count = 10
    // sampleWorkout.value = 10

    @State var workoutItems: [WorkouItemtDraft] = [
        WorkouItemtDraft(name: "Pushups", count: 10, value: 10),
    ]
    @State var newItemName: String = ""
    @State var newItemCount: String = ""
    @State var newItemValue: String = ""
    
    
    init(passedTaskItem: WorkoutSchedule?, initialDate: Date){
        if let taskItem = passedTaskItem {
            _name = State(initialValue: taskItem.name ?? "")
            _desc = State(initialValue: taskItem.desc ?? "")
            
        } else {
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
        }

        _isPublic = State(initialValue: false)
        _saveAsVideo = State(initialValue: false)
        _setAsRecurrent = State(initialValue: false)
        
        _monday = State(initialValue: false)
        _tuesday = State(initialValue: false)
        _wednesday = State(initialValue: false)
        _thursday = State(initialValue: false)
        _friday = State(initialValue: false)
        _saturday = State(initialValue: false)
        _sunday = State(initialValue: false)

        _startTime = State(initialValue: initialDate)
        _endTime = State(initialValue: initialDate)

    }
    
    
    
    // Helper function to return the binding for a specific day
    func binding(forDay dayIndex: Int) -> Binding<Bool> {
        switch dayIndex {
        case 0: return $monday
        case 1: return $tuesday
        case 2: return $wednesday
        case 3: return $thursday
        case 4: return $friday
        case 5: return $saturday
        case 6: return $sunday
        default: return .constant(false) // Return a constant binding for the default case
        }
    }

    // Helper function to get the checked state for a specific day
    func isChecked(forDay dayIndex: Int) -> Bool {
        binding(forDay: dayIndex).wrappedValue
    }

    // Helper function to update the state variable for a specific day
    func updateDay(forIndex dayIndex: Int, newValue: Bool) {
        switch dayIndex {
        case 0: $monday.wrappedValue = newValue
        case 1: $tuesday.wrappedValue = newValue
        case 2: $wednesday.wrappedValue = newValue
        case 3: $thursday.wrappedValue = newValue
        case 4: $friday.wrappedValue = newValue
        case 5: $saturday.wrappedValue = newValue
        case 6: $sunday.wrappedValue = newValue
        default: break
        }
    }
    
    struct SmallToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(action: {
                configuration.isOn.toggle()
            }) {
                HStack {
                    Text(configuration.isOn ? "✓" : "◦") // You can customize the symbols as needed
                    configuration.label
                }
                .foregroundColor(configuration.isOn ? .accentColor : .primary)
            }
            .buttonStyle(PlainButtonStyle()) // Ensure the button style doesn't affect the tap area
        }
    }


    // Define day labels
    let dayLabels = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "All", "", "", "", "", "", "", "", ""]

    
    var body: some View {
        
        Form{
            Section(header: Text("Workout Schedule")){
                TextField("Schedule Name", text: $name)
                TextField("Description", text: $desc)
            }
            
            
            Section(header: Text("Workout Items")) {
                ForEach(workoutItems) { item in
                    HStack {
                        Text("\(item.name) - \(item.count) - \(item.value)")
                        Spacer()
                        Button(action: {
                            if let index = workoutItems.firstIndex(where: { $0.id == item.id }) {
                                workoutItems.remove(at: index)
                            }
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }

                HStack {
                    TextField("Name", text: $newItemName)
                    TextField("Count", text: $newItemCount)
                        .keyboardType(.numberPad)
                    TextField("Value", text: $newItemValue)
                        .keyboardType(.decimalPad)
                    Button("Add Item") {
                        if let count = Int(newItemCount), let value = Int(newItemValue) {
                            let newWorkout = WorkouItemtDraft(name: newItemName, count: count, value: value)
                            workoutItems.append(newWorkout)
                            newItemName = ""
                            newItemCount = ""
                            newItemValue = ""
                        }
                    }
                }
            }

        
            
            Section(header: Text("Start and End Date")) {

                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)

                VStack(alignment: .leading) {
                    Text("Select Days:")
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack{

                                    
                                Toggle("Monday", isOn: $monday)
                                    .toggleStyle(SmallToggleStyle())

                                Toggle("Tuesday", isOn: $tuesday)
                                    .toggleStyle(SmallToggleStyle())

                                Toggle("Wednesday", isOn: $wednesday)
                                    .toggleStyle(SmallToggleStyle())

                            }
                            HStack{
                                Toggle("Thursday", isOn: $thursday)
                                    .toggleStyle(SmallToggleStyle())

                                Toggle("Friday", isOn: $friday)
                                    .toggleStyle(SmallToggleStyle())

                            }
                            HStack{
                                Toggle("Saturday", isOn: $saturday)
                                    .toggleStyle(SmallToggleStyle())
                                Toggle("Sunday", isOn: $sunday)
                                    .toggleStyle(SmallToggleStyle())
                            }
                        }
                    }
                }
            }
            
            


            Section(header: Text("Schedule Options")){
                Toggle("Is Public", isOn: $isPublic)
                Toggle("Save As Video", isOn: $saveAsVideo)
                Toggle("Set As Recurrent", isOn: $setAsRecurrent)
            }

            Section(){
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    
    func saveAction(){
        if workoutSchedule == nil {
//            selectedTaskItem = Item(context: viewContext)
            workoutSchedule = WorkoutSchedule(context: viewContext)
        }

        // Make a for loop to add all items and use workout_uuid.

        for item in workoutItems {
            let workoutItem = Workout(context: viewContext)
            workoutItem.name = item.name
            workoutItem.count = Int16(item.count)
            workoutItem.value = Int16(item.value)
            
            workoutItem.schedule_uuid = workoutSchedule?.uuid
        }

        workoutSchedule?.desc = desc
        workoutSchedule?.timestamp = Date()
        workoutSchedule?.name = name
        workoutSchedule?.starttime = startTime
        workoutSchedule?.endtime = endTime

        workoutSchedule?.monday = monday
        workoutSchedule?.tuesday = tuesday
        
        
        dateHolder.saveContext(viewContext)
        self.presentationMode.wrappedValue.dismiss()
    }
}
