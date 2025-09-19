//
//  ContentView.swift
//  Sequence
//
//  Created by Bruneau on 9/15/25.
//

import SwiftUI

struct ContentView: View {
    @State var pos = CGPoint(x: 200, y: 400)
    @State var scale = 1.0

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                pos = value.location
            }
            .onEnded { value in
                scale = 1
            }

        let pressGesture = LongPressGesture()
            .onEnded { value in
                scale = 2
            }

        Circle()
            .fill(.red)
            .frame(width: 50, height: 50)
            .scaleEffect(scale)
            .animation(.spring(), value: scale)
            .position(pos)
            .gesture(pressGesture.sequenced(before: dragGesture))
    }
}

#Preview {
    ContentView()
}
