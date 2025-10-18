//
//  ContentView.swift
//  Core Haptics Simple
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
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        if let pattern = try? CHHapticPattern(events: [event], parameters: []),
           let player = try? engine.makePlayer(with: pattern) {
            try? player.start(atTime: 0) //Play the pattern
        }
    }
}

#Preview {
    ContentView()
}
