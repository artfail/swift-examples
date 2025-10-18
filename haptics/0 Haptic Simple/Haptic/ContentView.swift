//
//  ContentView.swift
//  Haptic Simple
//
//  Created by Bruneau on 9/17/25.
//

import SwiftUI

struct ContentView: View {
    @State var flip = false
    
    var body: some View {
        Button("Success") {
            flip.toggle()
        }
        .sensoryFeedback(.success, trigger: flip)
    }
}

#Preview {
    ContentView()
}
