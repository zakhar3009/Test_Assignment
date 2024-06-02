//
//  ActiveView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

class ActiveViewModel: ObservableObject {
    @Environment(\.presentationMode) var presentationMode
    @Published var showingAlert = false
    @Published var timeInterval: TimeInterval = 0
    @Published var timerIsActive = false
    @Published var navigationIsActive = false
    @Published var currentExercise: Exercise {
        didSet {
            timeInterval = 0
        }
    }
    @Published var currentExerciseIndex = 0 {
        didSet {
            currentExercise = set.exercises[currentExerciseIndex]
        }
    }
    let timer = Timer
    .publish(every: 1, on: .main, in: .default)
    .autoconnect()
    let set: Set
    var completedSet: CompletedSet
    init(set: Set) {
        self.currentExercise = set.exercises[0]
        self.set = set
        self.completedSet = CompletedSet(set: set, completedExercises: [])
    }
}

struct ActiveView: View {
    @ObservedObject private var activeViewModel: ActiveViewModel
    init(set: Set) {
        self.activeViewModel = ActiveViewModel(set: set)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background2")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("\(activeViewModel.currentExerciseIndex + 1)")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.white)
                        + Text("/\(activeViewModel.set.exerciseCount)")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                        Spacer()
                        createCancelButton()
                            .onTapGesture {
                                activeViewModel.showingAlert.toggle()
                                activeViewModel.timerIsActive.toggle()
                            }
                            .alert("", isPresented: $activeViewModel.showingAlert) {
                                NavigationLink("Finish"){
                                    CompleteView(completedSet: activeViewModel.completedSet)
                                }
                                Button("Cancel") {
                                    activeViewModel.showingAlert.toggle()
                                    activeViewModel.timerIsActive.toggle()
                                }
                            } message: {
                                Text("Are you sure you want to finish workout?")
                            }
                    }
                    .padding(.horizontal, 15)
                    createExerciseTitle(exercise: activeViewModel.currentExercise)
                        .padding(.top, 25)
                    TimerView(time: $activeViewModel.timeInterval)
                        .padding(.top, 40)
                    createNextExerciseSection()
                        .padding(.top, 50)
                    Spacer()
                    createFooterButtons()
                }
            }
            .navigationBarBackButtonHidden(true)
            .onReceive(self.activeViewModel.timer) { _ in
                if activeViewModel.timerIsActive {
                    activeViewModel.timeInterval += 1
                }
            }
            .navigationDestination(isPresented: $activeViewModel.navigationIsActive, destination: {
                CompleteView(completedSet: activeViewModel.completedSet)
            })
        }
    }
    
    @ViewBuilder
    private func createCancelButton() -> some View {
        Image(systemName: "xmark")
            .foregroundStyle(.white)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    @ViewBuilder
    private func createExerciseTitle(exercise: Exercise) -> some View {
        VStack(alignment: .center) {
            HStack {
                Text("\(exercise.repeatsCount.contains("seconds") ? "" : "X")\(exercise.repeatsCount)")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.gray)
                Text(exercise.name)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.leading, 5)
            }
            Text(exercise.description)
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 10)
        }
    }
    
    @ViewBuilder
    private func createNextExerciseSection() -> some View {
        HStack {
            Text("Next : ")
                .font(.system(size: 17))
                .foregroundStyle(.white)
            Text(activeViewModel.currentExerciseIndex == activeViewModel.set.exerciseCount-1 ? "Finish" : activeViewModel.set.exercises[activeViewModel.currentExerciseIndex + 1].name)
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "play.fill")
                .foregroundStyle(.white.opacity(0.5))
        }
        .frame(height: 64)
        .padding(.horizontal, 20)
        .background(Color("SetBackgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    private func createFooterButtons() -> some View {
        HStack {
            Image(systemName: activeViewModel.timerIsActive ? "pause.fill" : "play.fill")
                .scaleEffect(1.5)
                .foregroundStyle(.white)
                .frame(width: 54, height: 54)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("ButtonColor"))
                }
                .onTapGesture {
                    activeViewModel.timerIsActive.toggle()
                }
            Button(action: {
                activeViewModel.completedSet.completedExercises.append(CompletedExercise(exercise: activeViewModel.currentExercise, time: activeViewModel.timeInterval))
                if activeViewModel.currentExerciseIndex < activeViewModel.set.exerciseCount-1 {
                    activeViewModel.currentExerciseIndex += 1
                } else {
                    activeViewModel.navigationIsActive = true
                }
            }, label: {
                createNextButton(buttonText: activeViewModel.currentExerciseIndex == activeViewModel.set.exerciseCount-1 ? "Finish" : "Next")
            })
        }
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    private func createNextButton(buttonText: String) -> some View {
        Text(buttonText)
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .background(Color("ButtonColor"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    
}

struct TimerView: View {
    @Binding var time: TimeInterval
    
    init(time: Binding<TimeInterval>) {
        self._time = time
    }
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("SetsBackgroundColor"))
                .stroke(Color("ButtonColor"), lineWidth: 10)
                .shadow(color: Color("ButtonColor"), radius: 8)
            Text(getFormatedTime(time: time))
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(.white)
        }
        .frame(width: 270, height: 270)
    }
    
    private func getFormatedTime(time: TimeInterval) -> String {
        let seconds = Int(time)
        return "\(seconds/60 >= 10 ? "\(seconds/60)" : "0\(seconds/60)"):" +
        "\(seconds%60 >= 10 ? "\(seconds%60)" : "0\(seconds%60)")"
    }
}

