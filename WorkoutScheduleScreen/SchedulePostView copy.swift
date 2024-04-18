//
//  SchedulePostView.swift
//  Sweat
//
//  Created by Admin on 4/7/24.
//

import Foundation
import SwiftUI

struct SchedulePostView: View {
    var header: String
    var bodyText: String
    var caption: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(header)
                //.font(.title)
                .fontWeight(.bold)
            Text(bodyText)
                .font(.body)
            Text(caption)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}
