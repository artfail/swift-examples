//
//  ContentView.swift
//  As1
//
//  Created by Bruneau on 10/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Post") {
                postMessage()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            signIn()
        }
    }    
}


#Preview {
    ContentView()
}
