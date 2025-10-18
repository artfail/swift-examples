//
//  ContentView.swift
//  Audio Feedback
//
//  Created by Bruneau on 9/21/25.
//

import AudioToolbox
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Play Sound") {
                // ~ 1000 to 1400
                AudioServicesPlaySystemSound(1003)
            }
        }
    }
}

#Preview {
    ContentView()
}
