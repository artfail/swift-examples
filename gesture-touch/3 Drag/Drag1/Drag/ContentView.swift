//
//  ContentView.swift
//  Drag
//
//  Created by Bruneau on 9/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var pos = CGPoint(x: 200, y: 400)
    
    var body: some View {
        VStack {
            Text("X:\(Int(pos.x)), Y:\(Int(pos.y))")
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .position(pos)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            pos = value.location
                        }
                )
        }
    }
}

#Preview {
    ContentView()
}
