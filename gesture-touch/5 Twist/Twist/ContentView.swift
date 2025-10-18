//
//  ContentView.swift
//  Twist
//
//  Created by Bruneau on 9/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var rot = Angle.zero
    @State var lastRot = Angle.zero
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .rotationEffect(rot + lastRot)
                .gesture(
                    RotateGesture()
                        .onChanged { value in
                            rot = value.rotation
                        }
                        .onEnded { value in
                            lastRot += rot
                            rot = Angle.zero;
                        }
                )
            
            VStack {
                Text("Rotation: \(Int(rot.degrees + lastRot.degrees)) Degrees")
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

