//
//  ProgressView.swift
//  Overload Progressively
//
//  Created by Emmanuel Alonge on 11/21/24.
//

import SwiftUI
import Charts

struct ProgressView: View {
    let workouts: [Workout]
    let exercise: String
    
    var filteredWorkouts: [Workout] {
        workouts.filter { $0.exercise == exercise }
    }
    
    var body: some View {
        VStack {
            Text("Progress for \(exercise)")
                .font(.headline)
            
            Chart {
                ForEach(filteredWorkouts) { workout in
                    LineMark(
                        x: .value("Date", workout.date),
                        y: .value("Weight", workout.weight)
                    )
                }
            }
            .frame(height: 300)
            .padding()
        }
    }
}

