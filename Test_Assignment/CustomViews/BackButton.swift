//
//  BackButton.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        Image(systemName: "arrow.backward")
            .foregroundStyle(.white)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
