//
//  ContentView.swift
//  Audio Playback Simple
//
//  Created by Bruneau on 9/21/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        Button("Play") {
            if let url = Bundle.main.url(forResource: "Janney_Drum3", withExtension: "wav") {
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } else {
                print("Audio file not found")
            }
        }
    }
}


#Preview {
    ContentView()
}
