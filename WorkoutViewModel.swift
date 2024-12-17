//
//  WorkoutViewModel.swift
//  Overload Progressively
//
//  Created by Emmanuel Alonge on 11/21/24.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = [] {
        didSet {
            saveWorkouts()
        }
    }
    
    private let workoutsKey = "workout_data"
    
    init() {
        loadWorkouts()
    }
    
    func addWorkout(exercise: String, weight: Double, reps: Int, sets: Int) {
        let newWorkout = Workout(exercise: exercise, weight: weight, reps: reps, sets: sets, date: Date())
        workouts.append(newWorkout)
    }
    
    private func saveWorkouts() {
        if let encoded = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encoded, forKey: workoutsKey)
        }
    }
    
    private func loadWorkouts() {
        if let data = UserDefaults.standard.data(forKey: workoutsKey),
           let decoded = try? JSONDecoder().decode([Workout].self, from: data) {
            workouts = decoded
        }
    }
}

