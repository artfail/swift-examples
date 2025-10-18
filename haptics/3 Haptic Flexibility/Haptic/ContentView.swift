//
//  ContentView.swift
//  Haptic Flexibility
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
    @State var softLevel  = 0.0;
    @State var solidLevel = 0.0;
    @State var rigidLevel = 0.0;
    
    
    var body: some View {
        Text ("Impact Flexibility and Intensity").font(.title).padding()
        
        Button("Soft " + String(format: "%.1f",softLevel)) {
            softLevel += 0.1
            
            if softLevel > 1{
                softLevel = 0
            }
        }
        .buttonStyle(BlueButton()).padding()
        .sensoryFeedback(.impact(flexibility: .soft, intensity: softLevel), trigger: softLevel)
        
        Button("Solid " + String(format: "%.1f",solidLevel)) {
            solidLevel += 0.1
            
            if solidLevel > 1{
                solidLevel = 0
            }
        }
        .buttonStyle(BlueButton()).padding()
        .sensoryFeedback(.impact(flexibility: .solid, intensity: solidLevel), trigger: solidLevel)
        
        Button("Rigid " + String(format: "%.1f",rigidLevel)) {
            rigidLevel += 0.1
            
            if rigidLevel > 1{
                rigidLevel = 0
            }
        }
        .buttonStyle(BlueButton()).padding()
        .sensoryFeedback(.impact(flexibility: .rigid, intensity: rigidLevel), trigger: rigidLevel)
        
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
