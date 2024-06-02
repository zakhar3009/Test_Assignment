//
//  AllSetsView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI


struct AllSetsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .top) {
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                BackButtonView()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                ScrollView {
                    LazyVStack {
                        ForEach(SetsData().generatedSets, id: \.name) { set in
                            NavigationLink(destination: { DetailView(set: set) },
                                           label: {
                                SetView(set: set)
                            })
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AllSetsView()
}


