//
//  MainScreen.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct MainScreen: View {
    var y = 0
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    VStack {
                        Image(systemName: "football.fill")
                        Text("Workout")
                    }
                }
            
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Settings")
                    }
                }
        }
        .overlay {
            VStack {
                Spacer()
                Text("+")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                    .frame(width: 44, height: 44)
                    .background(Color("ButtonColor"))
                    .clipShape(Circle())
            }
            .ignoresSafeArea(.keyboard) // Це дозволяє основному вмісту ігнорувати клавіатуру
        }
        .tint(.red)
        .navigationBarBackButtonHidden(true)
        
    }
}



#Preview {
    MainScreen()
}
