//
//  ContentView.swift
//  NavLinks
//
//  Created by Bruneau on 8/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            View1()
        }
    }
}

struct View1: View {
    var body: some View {
        ZStack {
            Color(red:0.9,green: 0.9,blue: 1)
            VStack {
                Text("This is View 1")
                NavigationLink("Go to View 2", destination: View2())
            }
            .navigationTitle("Main View")
        }.ignoresSafeArea()
    }
}

struct View2: View {
    var body: some View {
        VStack {
            Text("This is View 2")
            NavigationLink("Go to View 3", destination: View3())
        }
        .navigationTitle("View 2")
    }
}

struct View3: View {
    var body: some View {
        Text("This is View 3")
            .navigationTitle("View 3")
    }
}

#Preview {
    ContentView()
}
