//
//  ContentView.swift
//  Array Nav List
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    let pets = ["Dog", "Cat", "Rat"]

    var body: some View {
        NavigationStack {
            List {
                ForEach(pets, id: \.self) { item in
                    NavigationLink(value: item) {
                        Text(item)
                    }
                }
            }
            .navigationDestination(for: String.self) { item in
                DetailView(selectedItem: item)
            }
            .navigationTitle("My Pets")
        }
    }
}

struct DetailView: View {
    let selectedItem: String

    var body: some View {
        Text("Details for: \(selectedItem)")
            .navigationTitle(selectedItem)
    }
}

#Preview {
    ContentView()
}
