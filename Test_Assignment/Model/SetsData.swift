//
//  Models.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import Foundation
class SetsData {
    let exercises = [
            Exercise(name: "Push-Ups", repeatsCount: "15", description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up."),
            Exercise(name: "Jumping Jacks", repeatsCount: "30", description: "Stand upright with your legs together and arms at your sides, then jump to spread your legs and lift your arms overhead."),
            Exercise(name: "Squats", repeatsCount: "20", description: "Stand with feet shoulder-width apart, lower your hips back and down as if sitting in a chair, then return to standing."),
            Exercise(name: "Lunges", repeatsCount: "15 each leg", description: "Step forward with one leg, lowering your hips until both knees are bent at about a 90-degree angle, then return to standing."),
            Exercise(name: "Plank", repeatsCount: "60 seconds", description: "Hold a push-up position with your body in a straight line from shoulders to ankles, engaging your core."),
            Exercise(name: "Burpees", repeatsCount: "12", description: "From a standing position, drop into a squat, kick your feet back to a plank, perform a push-up, return to squat, and jump up."),
            Exercise(name: "High Knees", repeatsCount: "25 each leg", description: "Run in place, bringing your knees up towards your chest as high as possible with each step."),
            Exercise(name: "Mountain Climbers", repeatsCount: "20 each leg", description: "Start in a plank position, drive one knee toward your chest, then switch legs rapidly."),
            Exercise(name: "Bicycle Crunches", repeatsCount: "20 each side", description: "Lie on your back, lift your legs and shoulders, and perform a cycling motion while bringing opposite elbows to knees."),
            Exercise(name: "Jump Squats", repeatsCount: "15", description: "Perform a squat and then jump explosively, landing softly and immediately going into the next squat."),
            Exercise(name: "Dumbbell Rows", repeatsCount: "12 each arm", description: "With a dumbbell in one hand, bend over and pull the weight to your hip, keeping your back straight."),
            Exercise(name: "Tricep Dips", repeatsCount: "15", description: "Using a bench or chair, lower your body by bending your elbows, then push back up to the starting position."),
            Exercise(name: "Leg Raises", repeatsCount: "15", description: "Lie on your back with legs straight, lift them towards the ceiling, then lower them back down without touching the ground."),
            Exercise(name: "Twists", repeatsCount: "20 each side", description: "Sit on the ground with knees bent, lean back slightly and twist your torso, tapping the ground on each side."),
            Exercise(name: "Calf Raises", repeatsCount: "20", description: "Stand with feet shoulder-width apart, lift your heels off the ground, then slowly lower them back down."),
            Exercise(name: "Pull-Ups", repeatsCount: "10", description: "Hang from a pull-up bar with an overhand grip, pull your body up until your chin is above the bar, then lower back down."),
            Exercise(name: "Side Plank", repeatsCount: "30 seconds each side", description: "Lie on your side, prop yourself up on one elbow, and hold your body in a straight line."),
            Exercise(name: "Deadlifts", repeatsCount: "12", description: "With feet hip-width apart, lift a barbell from the ground to hip level, keeping your back straight and core engaged."),
            Exercise(name: "Flutter Kicks", repeatsCount: "30 seconds", description: "Lie on your back with legs extended, lift them slightly off the ground, and flutter them in a small, quick motion."),
            Exercise(name: "Box Jumps", repeatsCount: "12", description: "Jump onto a sturdy box or platform, landing softly, then step or jump back down.")
    ]
    
    var generatedSets: [Set] {
        for i in 0..<setsInfo.count {
            for _ in 1...setsInfo[i].exerciseCount {
                setsInfo[i].exercises.append(exercises[Int.random(in: 0..<exercises.count)])
            }
        }
        return setsInfo
    }

    var setsInfo = [
        Set(name: "Generated Set 1", duration: 30, exerciseCount: 10, exercises: []),
        Set(name: "Generated Set 2", duration: 22, exerciseCount: 12, exercises: []),
        Set(name: "Generated Set 3", duration: 35, exerciseCount: 14, exercises: []),
        Set(name: "Generated Set 4", duration: 25, exerciseCount: 17, exercises: []),
        Set(name: "Generated Set 5", duration: 37, exerciseCount: 19, exercises: []),
        Set(name: "Generated Set 6", duration: 19, exerciseCount: 18, exercises: []),
        Set(name: "Generated Set 7", duration: 32, exerciseCount: 18, exercises: []),
        Set(name: "Generated Set 8", duration: 30, exerciseCount: 12, exercises: []),
        Set(name: "Generated Set 9", duration: 36, exerciseCount: 15, exercises: [])
    ]
}
