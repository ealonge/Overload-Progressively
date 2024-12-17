//
//  ContentView.swift
//  Overload Progressively
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WorkoutViewModel()
    @State private var exercise = ""
    @State private var weight = ""
    @State private var reps = ""
    @State private var sets = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Input form for logging workouts
                Form {
                    Section(header: Text("Log Workout")) {
                        TextField("Exercise", text: $exercise)
                        TextField("Weight (lbs)", text: $weight)
                            .keyboardType(.decimalPad)
                        TextField("Reps", text: $reps)
                            .keyboardType(.numberPad)
                        TextField("Sets", text: $sets)
                            .keyboardType(.numberPad)
                        Button(action: {
                            if let weightDouble = Double(weight),
                               let repsInt = Int(reps),
                               let setsInt = Int(sets) {
                                viewModel.addWorkout(exercise: exercise, weight: weightDouble, reps: repsInt, sets: setsInt)
                                exercise = ""
                                weight = ""
                                reps = ""
                                sets = ""
                            } else {
                                print("Invalid input! Make sure to enter valid numbers.")
                            }
                        }) {
                            Text("Add Workout")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                
                // Display workout history
                List {
                    ForEach(viewModel.workouts) { workout in
                        VStack(alignment: .leading) {
                            Text(workout.exercise)
                                .font(.headline)
                            Text("\(workout.weight)lbs, \(workout.reps) reps, \(workout.sets) sets")
                                .font(.subheadline)
                            Text(workout.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Progressive Overload")
        }
    }
}
