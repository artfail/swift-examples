//
//  ContentView.swift
//  Audio Feedback
//
//  Created by Bruneau on 9/21/25.
//

import SwiftUI
import AudioToolbox

struct ContentView: View {
    
    var body: some View {
        VStack {
            Button("Play Bloop"){
                playSound(name:"Bloop")
            }
            
            Button("Play Pop"){
                playSound(name:"Pops")
            }
        }
    }
    
    func playSound(name:String) {
        if let soundURL = Bundle.main.url(forResource: name, withExtension: "wav") {
            var soundID: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
            AudioServicesPlaySystemSound(soundID)
            
        } else {
            print("Sound file not found.")
        }
    }
}

#Preview {
    ContentView()
}
