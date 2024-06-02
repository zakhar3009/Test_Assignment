//
//  PlaceholderView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 30.05.2024.
//

import SwiftUI

struct PlaceholderView: View {
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            Image("Background1")
                .resizable()
                .ignoresSafeArea()
            Image("Placeholder")
                .scaleEffect(3)
                .rotation3DEffect(.degrees(rotationAngle),
                                  axis: (x: 0.0, y: 0.0, z: 1.0))
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 3.5).repeatForever()) {
                rotationAngle = 360
            }
        }
    }
}


#Preview {
    PlaceholderView()
}
