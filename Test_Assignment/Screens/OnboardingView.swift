//
//  OnboardingView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 30.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isPlaceholderPresent = true
    var body: some View {
        NavigationStack {
            VStack {
                if isPlaceholderPresent {
                    PlaceholderView()
                }
                else {
                    ZStack {
                        Image("Background2")
                            .resizable()
                            .ignoresSafeArea()
                        VStack(alignment: .leading) {
                            Image("Player")
                                .resizable()
                                .frame(width: 347, height: 468)
                                .rotationEffect(.degrees(5))
                                .padding(.leading, -20)
                            VStack {
                                Text("Unleash Your Potential")
                                    .font(.system(size: 50, weight: .bold))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 32)
                                Text("Dive into the world of American football training. Explore dynamic workouts designed to unlock your gridiron potential.")
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, 32)
                            }
                            .padding(.top, -40)
                            NavigationLink {
                                MainScreen()
                            } label: {
                                ZStack {
                                    HStack {
                                        Spacer()
                                        Text("Start")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundStyle(.white)
                                        Spacer()
                                        Image(systemName: "arrow.forward")
                                            .foregroundStyle(.white)
                                            .frame(width: 32, height: 32)
                                            .background(Color.white.opacity(0.2))
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .offset(x: -10)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 54)
                                    .background(Color("ButtonColor"))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding(.horizontal, 12)
                                }
                            }
                            .padding(.top, 30)
                        }
                    }
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: isPlaceholderPresent)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isPlaceholderPresent = false
                }
            }
        }
    }
}


#Preview {
    OnboardingView()
}
