//
//  ContentView.swift
//  Audio Feedback
//
//  Created by Bruneau on 9/21/25.
//

//https://github.com/TUNER88/iOSSystemSoundsLibrary
//This list is not complete

import AudioToolbox
import SwiftUI

struct ContentView: View {
    
    @State var sounds10h = 1000
    @State var sounds11h = 1100
    @State var sounds12h = 1200
    @State var sounds13h = 1300
    
    
    var body: some View {
        VStack {
            Button("Play Sound: \(sounds10h)") {
                AudioServicesPlaySystemSound(SystemSoundID(sounds10h))
                sounds10h += 1
            }.buttonStyle(BlueButton())
            
            Button("Play Sound: \(sounds11h)") {
                AudioServicesPlaySystemSound(SystemSoundID(sounds11h))
                sounds11h += 1
            }.buttonStyle(BlueButton())
            
            Button("Play Sound: \(sounds12h)") {
                AudioServicesPlaySystemSound(SystemSoundID(sounds12h))
                sounds12h += 1
            }.buttonStyle(BlueButton())
            
            Button("Play Sound: \(sounds13h)") {
                AudioServicesPlaySystemSound(SystemSoundID(sounds13h))
                sounds13h += 1
            }.buttonStyle(BlueButton())
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

#Preview {
    ContentView()
}
