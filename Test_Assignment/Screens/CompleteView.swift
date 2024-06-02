//
//  CompleteView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct CompleteView: View {
    let completedSet: CompletedSet
    var body: some View {
        VStack {
            ZStack() {
                Image("Background2")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Workout complete!")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Color("ButtonColor"))
                    Text(completedSet.set.name)
                        .font(.system(size: 35, weight: .bold))
                        .foregroundStyle(.white)
                    HStack(spacing: 50) {
                        createExerciseInfo(title: "Time", text: completedSet.formattedTotalTime)
                        createExerciseInfo(title: "Exer", text: "\(completedSet.completedExercises.count)/\(completedSet.set.exerciseCount)")
                    }
                    .padding(.top)
                }
            }
            .frame(height: 293)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12){
                    Text("Detail of training")
                        .font(.system(size: 24,weight: .bold))
                        .foregroundStyle(.white)
                    ForEach(0..<completedSet.completedExercises.count, id: \.self) { index in
                        HStack {
                            Text(completedSet.completedExercises[index].exercise.name)
                                .font(.system(size: 20,weight: .bold))
                                .foregroundStyle(.white)
                            Spacer()
                            Text(completedSet.completedExercises[index].formattedTime)
                                .font(.system(size: 17,weight:.bold))
                                .foregroundStyle(.white)
                            Text("min.")
                                .font(.system(size:17))
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        Spacer()
        NavigationLink(destination: { MainScreen() }) {
            HStack {
                Spacer()
                Text("Complete")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                Image(systemName: "checkmark")
                    .offset(x: -10)
            }
            .foregroundStyle(.white)
            .frame(height: 54)
            .background(Color("ButtonColor"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 15)
            .padding(.bottom, 40)
        }
    }
    .ignoresSafeArea()
    .background(Color("SetsBackgroundColor"))
    .navigationBarBackButtonHidden(true)
    }
}
    
private func createExerciseInfo(title: String, text: String) -> some View {
    VStack {
        Text(title)
            .font(.system(size: 12, weight: .bold))
            .foregroundStyle(.gray)
        Text(text)
            .font(.system(size: 32, weight: .bold))
            .foregroundStyle(.white)
    }
}
