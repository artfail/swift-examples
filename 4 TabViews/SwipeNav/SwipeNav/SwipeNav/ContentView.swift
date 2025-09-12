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
        TabView{
            ZStack {
                Color.blue
                Text("Step 1")
            }
            ZStack {
                Color.teal
                Text("Step 2")
            }
            ZStack {
                
                Text("Step 3")
            }
            ZStack {
                Color.orange
                Text("Step 4")
            }
        }.tabViewStyle(.page).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    ContentView()
}

