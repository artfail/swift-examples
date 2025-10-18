//
//  ContentView.swift
//  Audio Playback Controls
//
//  Created by Bruneau on 9/21/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer?
    
    @State var volume: Float = 0.5
    @State var pan: Float = 0.0
    @State var speed: Float = 1.0

    //audioPlayer?.numberOfLoops = 0
    //audioPlayer?.numberOfLoops = -1
    
    
    var body: some View {
        VStack{
            Spacer()
            Button("Play") {
                if(audioPlayer == nil){
                    initSound(name: "Janney_Drum3")
                }
                audioPlayer?.play()
            }
            
            Button("Stop") {
                audioPlayer?.stop() //I think this frees up resources but I am not sure
                audioPlayer?.currentTime = 0; //resets the time
            }
            
            Button("Pause") {
                audioPlayer?.pause()
            }
            
            Button("Skip 10sec") {
                audioPlayer?.currentTime += 10
            }
            
            Spacer()
            
            Text("Volume")
            Slider(value: $volume, in: 0.0...1.0, step: 0.1) {
            } onEditingChanged: { editing in
                if !editing {
                    audioPlayer?.volume = volume
                }
            }.padding(.horizontal)
            
            Text("Pan")
            Slider(value: $pan, in: -1.0...1.0, step: 0.1) {
            } onEditingChanged: { editing in
                if !editing {
                    audioPlayer?.pan = pan
                }
            }.padding(.horizontal)
            
            Text("Speed")
            Slider(value: $speed, in: 0.5...2.0, step: 0.1){
            } onEditingChanged: { editing in
                if !editing {
                    audioPlayer?.rate = speed
                }
            }.padding(.horizontal)
            
            Spacer()
            
        }.font(.title).padding()
    }
    
    func initSound(name: String) {
        if let url = Bundle.main.url(forResource: name, withExtension: "wav"){
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
            audioPlayer?.enableRate = true //needed for rate changes
        } else {
            print("Audio file not found")
        }
    }
}


#Preview {
    ContentView()
}

