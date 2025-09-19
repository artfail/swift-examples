//
//  ContentView.swift
//  Multi-touch paint
//
//  Created by Bruneau on 9/15/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Sandbox()
    }
}

struct Sandbox: View {

    @State var touchPos: [CGPoint] = []
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(.green)
                .ignoresSafeArea()
            ForEach(touchPos, id: \.self) { pos in
                Circle()
                    .fill(.blue)
                    .opacity(0.2)
                    .frame(width: 100,height: 100)
                    .position(pos)
            }
        }
        .gesture(
            SpatialEventGesture()
                .onChanged { events in
                    for event in events {
                        print(event.phase)
                        touchPos.append(event.location)
                    }
                }
            /*
                .onEnded(){ events in
                    for event in events {
                        print(event.phase)
                        touchPos = []
                    }
                }
             */
        )
    }
}
 


#Preview {
    ContentView()
}
