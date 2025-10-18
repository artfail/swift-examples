//
//  ContentView.swift
//  Tap Location
//
//  Created by Bruneau on 9/12/25.
//
import SwiftUI

struct ContentView: View {
    @State var tapLocation: CGPoint = .zero
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .ignoresSafeArea()
                .onTapGesture(){ location in
                    tapLocation = location
                    tapLocation.x = 100
                    print("Local tap location: \(location)")
                }
            
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .position(tapLocation)
                .animation(.easeInOut, value: tapLocation)
        }
    }
}


#Preview {
    ContentView()
}
