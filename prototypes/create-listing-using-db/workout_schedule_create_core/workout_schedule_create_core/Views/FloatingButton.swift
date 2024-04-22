//
//  FloatingButton.swift
//  workout_schedule_create_core
//
//  Created by Nene Wang  on 4/21/24.
//

import Foundation

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        Spacer()
        HStack{
            NavigationLink(destination: TaskListView()){
                Text("+ New Task")
                    .font(.headline)
            }
            .padding(15)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(30)
            .padding(30)
        }
    }
}


