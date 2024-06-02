//
//  DetailView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let set: Set
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("SetsBackgroundColor")
            .frame(maxHeight: .infinity)
            .ignoresSafeArea()
            Image("FootballGradient")
                .resizable()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButtonView()
                })
                Spacer()
            }
            .padding(.leading, 15)
            VStack(alignment: .leading) {
                createTitle()
                Text("List of exercises")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                ScrollView {
                    LazyVStack {
                        ForEach(0..<set.exercises.count, id: \.self){ index in
                            createExerciseView(exercise: set.exercises[index])
                        }
                    }
                    .padding(.bottom, 80)
                }
            }
            .padding(.horizontal, 15)
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    createStartButton()
                }
                .frame(height: 244)
                .background(LinearGradient(
                    gradient: Gradient(colors: [Color("SetsBackgroundColor").opacity(0), Color("SetsBackgroundColor").opacity(1.0)])
                        ,
                    startPoint: .top,
                    endPoint: .bottom
                ))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func createTitle() -> some View {
        VStack(alignment: .leading) {
            Text(set.name)
            .font(.system(size: 44, weight: .bold))
            .foregroundStyle(.white)
            HStack {
                SetInfoView(imageName: "clock", duration: "\(Int(set.duration)) min.")
                SetInfoView(imageName: "football.fill", duration: "\(set.exerciseCount) exer.")
            }
            .offset(y: -15)
        }
        .padding(.trailing)
        .padding(.top, 100)
    }
    
    @ViewBuilder
    private func createExerciseView(exercise: Exercise) -> some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
                .padding(.top, 10)
                .padding(.horizontal, 10)
            HStack() {
                Text("Recommended to repeat")
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                Spacer()
                Text("\(exercise.repeatsCount.contains("seconds") ? "" : "X")\(exercise.repeatsCount)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.trailing, 10)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .padding(.horizontal, 10)
        }
        .background(Color("SetBackgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    @ViewBuilder
    private func createStartButton() -> some View {
        NavigationLink(destination: { ActiveView(set: set) },
                       label: {
            ZStack {
                HStack {
                    Spacer()
                    Text("Start Training")
                        .font(.system(size: 21, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "flame.fill")
                        .foregroundStyle(.white)
                        .offset(x: -15)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color("ButtonColor"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            }
        })
        
    }
    
}
