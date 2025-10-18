//
//  ContentView.swift
//  Scope
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

var greeting1 = "Nice to see you"

struct ContentView: View {
    var body: some View {
        HStack {
            Button("Say Hi") {
                sayHi()
            }
            Text ("|")
            Button("Say Bye") {
                sayHi()
            }
        }.font(.title)
    }
}

func sayHi() {
    let greeting2 = "Hello"
    print(greeting1)
    print(greeting2)
}

func sayBye() {
    let greeting2 = "Bye now"
    print(greeting1)
    print(greeting2)
}


#Preview {
    ContentView()
}
