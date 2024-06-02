//
//  MainView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct MainView: View {
    @State var searchingText: String = ""
    var body: some View {
        VStack {
            ZStack {
                Image("SearchbarBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Hello, champion! 👋")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.leading, 20)
                       Spacer()
                    }
                    SearchBar(searchingText: $searchingText)
                        .padding(.top, 10)
                }
                .padding(.bottom, 40)
            }
            .frame(height: 140)
            ScrollView {
                VStack(spacing: 15) {
                    HStack {
                        Text("Generated sets")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                        Spacer()
                        NavigationLink(destination: {
                            AllSetsView()
                        }, label: {
                            HStack {
                                Text("View all")
                                Image(systemName: "arrow.right")
                            }
                        })
                        .foregroundStyle(.red)
                    }
                    .padding(.vertical, 20)
                    ForEach(searchingText == "" ? Array(SetsData().generatedSets[0...3]) :
                                SetsData().generatedSets.filter { $0.name.lowercased().contains(searchingText.lowercased()) }, id: \.name) { set in
                        NavigationLink(destination: { DetailView(set: set) },
                                       label: {
                            SetView(set: set)
                        })
                        
                    }
                }
                .padding(.horizontal, 15)
                Spacer()
            }
        }
        .background(Color("SetsBackgroundColor"))
    }
}

struct SearchBar: View {
    @Binding private var searchingText: String
    
    init(searchingText: Binding<String>) {
        self._searchingText = searchingText
    }
    
    var body: some View {
        ZStack {
            TextField("Search...", text: $searchingText)
                .padding(.horizontal, 15)
                .background(.white)
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 42, height: 42)
                        .background(Color("ButtonColor"))
                })
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.trailing, 5)
            }
        }
        .frame(height: 50)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .padding(.horizontal, 20)
        
    }
}

#Preview {
    MainView()
}
