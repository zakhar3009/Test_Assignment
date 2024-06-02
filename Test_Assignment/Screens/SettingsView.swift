//
//  SettingsView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Settings")
                    .font(.system(size: 32,weight: .bold))
                    .foregroundStyle(.white)
                LazyVStack {
                    createMenuItem(imageName: "doc", text: "Privacy policy", destinationView: PolicyView())
                    Divider()
                        .background(.gray)
                        .padding(.horizontal, 15)
                    createMenuItem(imageName: "doc", text: "Terms of use", destinationView: TermsView())
                }
                .background(Color.white.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func createMenuItem(imageName: String, text: String, destinationView: some View) -> some View {
        NavigationLink(destination: destinationView, label: {
            HStack {
                Image(systemName: imageName)
                    .foregroundStyle(.white.opacity(0.2))
                    .scaleEffect(1.5)
                    .padding(.leading, 20)
                Text(text)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.2))
                    .padding(.trailing, 15)
            }
            .frame(height: 50)
        })
        
    }
}

#Preview {
    SettingsView()
}
