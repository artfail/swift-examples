//
//  ContentView.swift
//  Haptic Weight
//
//  Created by Bruneau on 9/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Feedback()
    }
}

struct Feedback: View {
    @State var lightLevel  = 0.0;
    @State var mediumLevel = 0.0;
    @State var heavyLevel = 0.0;
    
    
    var body: some View {
        Text ("Impact Weight and Intensity").font(.title).padding()
        
        Button("Light " + String(format: "%.1f",lightLevel)) {
            lightLevel += 0.1
            
            if lightLevel > 1{
                lightLevel = 0
            }
        }
        .buttonStyle(BlueButton()).padding()
        .sensoryFeedback(.impact(weight: .light, intensity: lightLevel), trigger: lightLevel)
        
        Button("Medium " + String(format: "%.1f",mediumLevel)) {
            mediumLevel += 0.1
            
            if mediumLevel > 1{
                mediumLevel = 0
            }
        }
        .buttonStyle(BlueButton()).padding()
        .sensoryFeedback(.impact(weight: .medium, intensity: mediumLevel), trigger: mediumLevel)
        
        Button("Heavy " + String(format: "%.1f",heavyLevel)) {
            heavyLevel += 0.1
            
            if heavyLevel > 1{
                heavyLevel = 0
            }
        }
        .buttonStyle(BlueButton()).padding()
        .sensoryFeedback(.impact(weight: .heavy, intensity: heavyLevel), trigger: heavyLevel)
        
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
