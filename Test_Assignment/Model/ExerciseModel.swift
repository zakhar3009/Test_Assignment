//
//  ExersizeModel.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import Foundation

struct Exercise: Hashable {
    let name: String
    let repeatsCount: String
    let description: String
}

struct CompletedExercise {
    let exercise: Exercise
    let time: TimeInterval
    
    var formattedTime: String {
        let seconds = Int(time)
        return "\(seconds/60):\(seconds % 60 >= 10 ? "\(seconds % 60)" : "0\(seconds % 60)")"
    }
}
