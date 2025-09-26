//
//  ContentView.swift
//  Audio Feedback
//
//  Created by Bruneau on 9/21/25.
//

import SwiftUI
import AudioToolbox


var soundIDs: [String: SystemSoundID] = [:]

struct ContentView: View {
    var body: some View {
        VStack{
            Button("Play Pops") {
                playSound(name:"Pop") //assumes .wav
            }
            Button("Play Bloop") {
                playSound(name:"Bloop")
            }
        }
    }
}

func initSound(name:String) {
    if let soundURL = Bundle.main.url(forResource: name, withExtension: "wav"){
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        soundIDs[name] = soundID
    }else {
        print("Sound file not found.")
    }
}

func playSound(name:String) {
    if soundIDs[name] == nil { // initialize if nil
        initSound(name:name)
    }
    AudioServicesPlaySystemSound(soundIDs[name] ?? 1104) //play 1104 if something went wrong
}

#Preview {
    ContentView()
}
