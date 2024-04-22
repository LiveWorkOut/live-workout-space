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
    }
    
    var body: some View {
        
        Form{
            Section(header: Text("Task")){
                TextField("Task Name", text: $name)
                TextField("Desc", text: $desc)
            }
            
            Section(header: Text("Is Completed")){
                Toggle("Is Completed", isOn: $isCompleted)
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




