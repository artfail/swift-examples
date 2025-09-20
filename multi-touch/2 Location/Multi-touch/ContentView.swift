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
    
    @State var spatialEvents: [String:CGPoint] = [:]
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(.green)
                .ignoresSafeArea()
            
            ForEach(Array(spatialEvents.values), id: \.self) { value in
                Circle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .position(value)
                
                Text("X:\(Int(value.x)) Y:\(Int(value.y))")
                    .position(value)
            }
        }
        .gesture(
            SpatialEventGesture()
                .onChanged { events in
                    for event in events {
                        if event.phase == .active {
                        spatialEvents["\(event.id)"] = event.location
                        } else {
                            spatialEvents["\(event.id)"] = nil
                        }
                    }
                }
                .onEnded(){ events in
                    for event in events {
                        spatialEvents["\(event.id)"] = nil
                    }
                }
        )
    }
}
 


#Preview {
    ContentView()
}
