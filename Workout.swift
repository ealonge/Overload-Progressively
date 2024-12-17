//
//  Workout.swift
//  Overload Progressively
//
//  Created by Emmanuel Alonge on 11/21/24.
//

import Foundation

struct Workout: Identifiable, Codable {
    var id: UUID   // Change to var
    let exercise: String
    let weight: Double
    let reps: Int
    let sets: Int
    let date: Date
    
    // Default initializer to assign id if needed
    init(id: UUID = UUID(), exercise: String, weight: Double, reps: Int, sets: Int, date: Date) {
        self.id = id
        self.exercise = exercise
        self.weight = weight
        self.reps = reps
        self.sets = sets
        self.date = date
    }
}
