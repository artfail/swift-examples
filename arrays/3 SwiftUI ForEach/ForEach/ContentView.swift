//
//  ContentView.swift
//  ForEach
//
//  Created by Bruneau on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyPets()
    }
}

struct MyPets: View {
    let pets = ["Chicken", "Rock", "Rat", "Frog"]
    
    var body: some View {
        VStack {
            ForEach(pets, id: \.self) { pet in
                Text(pet).font(.largeTitle)
            }
        }
    }
}


#Preview {
    ContentView()
}
