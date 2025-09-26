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
    @State private var player1: CHHapticPatternPlayer?
    @State private var player2: CHHapticPatternPlayer?

    var body: some View {
        VStack {
            Button("Custom Haptic 1") {
                try? player1?.start(atTime: 0)
            }.padding()

            Button("Custom Haptic 2") {
                try? player2?.start(atTime: 0)
            }.padding()
        }
        
        .onAppear {
            initHaptics()
        }
    }

    func initHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        engine = try? CHHapticEngine()
        try? engine?.start()

        let intens1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharp1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let event1 = CHHapticEvent(eventType: .hapticTransient, parameters: [intens1, sharp1], relativeTime: 0)
        
        let intens2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let sharp2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intens2, sharp2], relativeTime: 0.5, duration: 1.0)
        
        let event3 = CHHapticEvent(eventType: .hapticTransient, parameters: [intens1, sharp1], relativeTime: 0.5)
        

        let pattern1 = try? CHHapticPattern(events: [event1, event2], parameters: [])
        player1 = try? engine?.makePlayer(with: pattern1!)
        
        let pattern2 = try? CHHapticPattern(events: [event1, event3], parameters: [])
        player2 = try? engine?.makePlayer(with: pattern2!)
    }

}
#Preview {
    ContentView()
}
