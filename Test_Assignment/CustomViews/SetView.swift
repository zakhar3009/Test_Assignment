//
//  SetView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct SetView: View {
    let set: Set
    
    var body: some View {
        HStack {
            Image("Football")
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 10)
            VStack(alignment: .leading) {
                Text(set.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .offset(y: -5)
                HStack {
                    SetInfoView(imageName: "clock", duration: "\(Int(set.duration)) min.")
                    SetInfoView(imageName: "football.fill", duration: "\(set.exerciseCount) exer.")
                }
            }
            .padding(.leading, 5)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.white.opacity(0.2))
                .padding(.trailing, 15)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color("SetBackgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
 
}

struct SetInfoView: View {
    let imageName: String
    let duration: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(.white)
                .scaleEffect(0.85)
            Text(duration)
                .font(.system(size: 15))
                .foregroundStyle(.white)
        }
        .padding(.all, 10)
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
