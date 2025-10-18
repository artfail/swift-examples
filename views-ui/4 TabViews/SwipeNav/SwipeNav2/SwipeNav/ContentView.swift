//
//  ContentView.swift
//  SwipeNav
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Onboarding()
    }
}

struct Onboarding: View {
    var body: some View {
        VStack {
            TabView{
                ZStack {
                    Color.blue//.opacity(0.5)
                    Text("Step 1").font(.largeTitle)
                }
                .foregroundColor(.orange)
                ZStack {
                    Color(red: 0, green: 0, blue: 1)
                    Text("Step 2").font(.largeTitle)
                }
                .foregroundColor(.green)
                ZStack {
                    Color(red: 0.9, green: 0.9, blue: 0)
                    Button(action: signUp) {
                        Label("Sign Up", systemImage: "person.circle").font(.largeTitle).padding()
                    }.buttonStyle(.borderedProminent).buttonBorderShape(.capsule)
                }
            }.tabViewStyle(.page) .cornerRadius(10).padding(.horizontal, 10)
        }.background(.black).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
           
    }
    
    func signUp() {
        print("click")
    }
}

#Preview {
    ContentView()
}
