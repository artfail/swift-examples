//
//  ContentView.swift
//  PagesArray
//
//  Created by Bruneau on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Onboarding()
    }
}

struct Onboarding: View {
    private let bgColors: [Color] = [.blue, .cyan, .purple]
    
    var body: some View {
        VStack {
            TabView{
                ForEach(0..<bgColors.count, id: \.self) {i in
                    ZStack {
                        bgColors[i]
                        Text("Step \(i+1)").font(.largeTitle)
                    }
                    .foregroundColor(.white)
                    
                }
            }.tabViewStyle(.page) .cornerRadius(10).padding(.horizontal, 10)
        }.background(.black).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
           
    }
}
#Preview {
    ContentView()
}
