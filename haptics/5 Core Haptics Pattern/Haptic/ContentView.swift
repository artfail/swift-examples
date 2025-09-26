//
//  ContentView.swift
//  Core Haptics Pattern
//
//  Created by Bruneau on 9/17/25.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var engine: CHHapticEngine?

    var body: some View {
        VStack {
            Button("Custom Haptic") {
                playHaptic()
            }
        }.onAppear(){
            initHaptics()
        }
    }
    
    func initHaptics() {
        //Setup the Engine
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        engine = try? CHHapticEngine()
        try? engine?.start()
    }

    func playHaptic() {
        //Make a pattern
        guard let engine = engine else { return }
        
        let intens1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharp1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intens1, sharp1], relativeTime: 0)
        
        let intens2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let sharp2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intens2, sharp2], relativeTime: 0.5, duration: 1.0)

        
        if let pattern = try? CHHapticPattern(events: [event1, event2], parameters: []),
           let player = try? engine.makePlayer(with: pattern) {
            try? player.start(atTime: 0) //Play the pattern
        }
    }
}

#Preview {
    ContentView()
}

