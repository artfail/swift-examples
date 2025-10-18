//
//  ContentView.swift
//  Multi-touch Make Dots
//
//  Created by Bruneau on 9/15/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        MakeDots()
    }
}

struct MakeDots: View {
    //iPhones are capped at 5 touches
    
    @State var dots:[SpatialEventCollection.Event.ID:CGPoint] = [:]
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.green)
                .ignoresSafeArea()
            
            ForEach(Array(dots.keys), id: \.self) { key in
                Circle()
                    .fill(idToColor(id:key))
                    .frame(width: 100, height: 100)
                    .position(dots[key] ?? .zero)
            }
        }
        .gesture(
            SpatialEventGesture()
                .onChanged { events in
                    for event in events {
                        if event.phase == .active {
                            dots[event.id] = event.location
                            //print(dots)
                        } else {
                            dots[event.id] = nil
                        }
                    }
                }
                .onEnded { events in
                    for event in events {
                        dots[event.id] = nil
                    }
                }
        )
    }
}
 
func idToColor(id:SpatialEventCollection.Event.ID) -> Color {
    let r:CGFloat = CGFloat(abs(id.hashValue / 100) % 10) / 10
    let g:CGFloat = CGFloat(abs(id.hashValue / 10) % 10) / 10
    let b:CGFloat = CGFloat(abs(id.hashValue) % 10) / 10
    
    return Color(red: r, green: g, blue: b)
   }

#Preview {
    ContentView()
}
