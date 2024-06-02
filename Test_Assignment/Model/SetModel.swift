//
//  SetModel.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import Foundation

struct Set {
    let name: String
    let duration: TimeInterval
    let exerciseCount: Int
    var exercises: [Exercise]
}

struct CompletedSet {
    let set: Set
    var totalTime: TimeInterval {
        return completedExercises.reduce(0) { result, exercise in
            result + exercise.time
        }
    }
    var completedExercises: [CompletedExercise]
    var formattedTotalTime: String {
        let seconds = Int(totalTime)
        return "\(seconds/60):\(seconds % 60 >= 10 ? "\(seconds % 60)" : "0\(seconds % 60)")"
    }
}

