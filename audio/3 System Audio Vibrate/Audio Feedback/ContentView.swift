//
//  ContentView.swift
//  Audio Vibrate
//
//  Created by Bruneau on 9/21/25.
//

//https://github.com/TUNER88/iOSSystemSoundsLibrary
//This list is not complete

import AudioToolbox
import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Button("SMS Received: 1011") { //seems the same as 1311
                AudioServicesPlaySystemSound(1011)
            }.buttonStyle(BlueButton())
            
            Button("FailedUnlock: 1102") {
                AudioServicesPlaySystemSound(1102)
            }.buttonStyle(BlueButton())
           
            Button("RingerVibeChanged: 1350") {
                AudioServicesPlaySystemSound(1350)
            }.buttonStyle(BlueButton())
            
            Button("SilentVibeChanged: 1351") {
                AudioServicesPlaySystemSound(1351)
            }.buttonStyle(BlueButton())
            
            Button("Vibrate: 4095") {
                AudioServicesPlaySystemSound(4095) 
            }.buttonStyle(BlueButton())
            
            Button("kSystemSoundID_Vibrate") {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }.buttonStyle(BlueButton())
        }
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
