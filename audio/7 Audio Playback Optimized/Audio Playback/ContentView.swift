//
//  ContentView.swift
//  Audio Playback Simple Optimized
//
//  Created by Bruneau on 9/21/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        Button("Play") {
            if(audioPlayer == nil){
                initSound(name: "Janney_Drum3")
            }
            audioPlayer?.play()
        }
        
        Button("Stop") {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0
        }
    }
    
    func initSound(name: String) {
        if let url = Bundle.main.url(forResource: name, withExtension: "wav"){
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
        } else {
            print("Audio file not found")
        }
    }
}


#Preview {
    ContentView()
}
