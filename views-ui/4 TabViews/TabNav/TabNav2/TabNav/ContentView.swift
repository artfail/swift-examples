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
    @State var activeTab = 1
    
    var body: some View {
        TabView(selection: $activeTab){
            ZStack {
                Color.blue
                Text("Home").foregroundStyle(Color.white)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            ZStack {
                Color.teal
                Text("New Post").foregroundStyle(Color.white)
            }
            .tabItem {
                Label("New Post", systemImage: "plus")
            }
            .tag(1)
            
            ZStack {
                Color.teal
                Text("New Post").foregroundStyle(Color.white)
            }
            .tabItem {
                Label("New Post", systemImage: "plus")
            }
            .tag(2)
            
            ZStack {
                Color.orange
                VStack{
                    Text("Edit Posts")
                    
                    Button("Go Home"){
                        activeTab = 0
                    }
                }
            }
            .tabItem {
                Label("Edit", systemImage: "pencil")
            }
            .tag(3)
            
        }
    }
}

#Preview {
    ContentView()
}

