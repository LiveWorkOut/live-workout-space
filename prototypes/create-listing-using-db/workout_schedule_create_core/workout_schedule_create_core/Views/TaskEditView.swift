//
//  TaskEditView.swift
//  workout_schedule_create_core
//
//  Created by Nene Wang  on 4/21/24.
//

import Foundation
import SwiftUI

struct TaskEditView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var selectedTaskItem: Item?
    @State var name: String
    @State var desc: String
    @State var timestamp: Date
    @State var isCompleted: Bool
    
    @State var isPublic: Bool
    @State var saveAsVideo: Bool
    @State var setAsRecurrent: Bool
    // Start and end date.
    @State var startDate: Date
    @State var endDate: Date

    // Monday to friday
    @State var monday: Bool
    @State var tuesday: Bool
    @State var wednesday: Bool
    @State var thursday: Bool
    @State var friday: Bool
    @State var saturday: Bool
    @State var sunday: Bool

    
    init(passedTaskItem: Item?, initialDate: Date){
        if let taskItem = passedTaskItem{
            _name = State(initialValue: taskItem.name ?? "")
            _desc = State(initialValue: taskItem.desc ?? "")
            _timestamp = State(initialValue: taskItem.timestamp ?? initialDate)
            _isCompleted = State(initialValue: false)
            
        }else{
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
            _timestamp = State(initialValue: passedTaskItem?.timeCompleted ?? initialDate)
            _isCompleted = State(initialValue: false)
        }

        _isPublic = State(initialValue: false)
        _saveAsVideo = State(initialValue: false)
        _setAsRecurrent = State(initialValue: false)
        _startDate = State(initialValue: initialDate)
        _endDate = State(initialValue: initialDate)
        _monday = State(initialValue: false)
        _tuesday = State(initialValue: false)
        _wednesday = State(initialValue: false)
        _thursday = State(initialValue: false)
        _friday = State(initialValue: false)
        _saturday = State(initialValue: false)
        _sunday = State(initialValue: false)

    }
    
    
    // Checkbox field view
    struct CheckboxField: View {
        let id: Int
        let label: String
        @Binding var isChecked: Bool
        
        var body: some View {
            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    Text(label)
                }
            }
            .foregroundColor(isChecked ? .accentColor : .primary)
        }
    }

    // Helper functions
    func isChecked(forDay dayIndex: Int) -> Bool {
        switch dayIndex {
        case 0: return monday
        case 1: return tuesday
        case 2: return wednesday
        case 3: return thursday
        case 4: return friday
        case 5: return saturday
        case 6: return sunday
        default: return false
        }
    }

    func updateDay(forIndex dayIndex: Int, newValue: Bool) {
        switch dayIndex {
        case 0: monday = newValue
        case 1: tuesday = newValue
        case 2: wednesday = newValue
        case 3: thursday = newValue
        case 4: friday = newValue
        case 5: saturday = newValue
        case 6: sunday = newValue
        default: break
        }
    }

    // Define day labels
    let dayLabels = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "All", "", "", "", "", "", "", "", ""]

    
    var body: some View {
        
        Form{
            Section(header: Text("Schedule")){
                TextField("Schedule Name", text: $name)
                TextField("Description", text: $desc)
            }
            
            

            Section(header: Text("Start and End Date")) {
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                
                VStack(alignment: .leading) {
                    Text("Select Days:")
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(0..<4) { row in
                                HStack {
                                    ForEach(0..<2) { column in
                                        let dayIndex = row * 2 + column
                                        // Skip if dayIndex is out of bounds
                                        
                                        CheckboxField(
                                            id: dayIndex,
                                            label: dayLabels[dayIndex],
                                            isChecked: Binding(
                                                get: { isChecked(forDay: dayIndex) },
                                                set: { newValue in updateDay(forIndex: dayIndex, newValue: newValue) }
                                            )
                                        )

                                    }
                                }
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
    
    func displayCOmps() -> DatePickerComponents
    {
        return isCompleted ? [.hourAndMinute, .date] : [.date]
    }
    
    func saveAction(){
        if selectedTaskItem == nil{
            selectedTaskItem = Item(context: viewContext)
        }
        
        selectedTaskItem?.timestamp = Date()
        selectedTaskItem?.name = name
        selectedTaskItem?.isCompleted = false
        
        dateHolder.saveContext(viewContext)
        self.presentationMode.wrappedValue.dismiss()
        
        
        
    }
    
}




