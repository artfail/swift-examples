//
//  ContentView.swift
//  TabNav
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
                Text("Home").foregroundStyle(Color.white)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            ZStack {
                Color.teal
                Text("New Post").foregroundStyle(Color.white)
            }
            .tabItem {
                Label("New Post", systemImage: "plus")
            }
            
            ZStack {
                Color.orange
                Text("Edit Posts")
            }
            .tabItem {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
}

#Preview {
    ContentView()
}

