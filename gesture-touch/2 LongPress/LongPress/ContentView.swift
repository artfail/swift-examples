//
//  ContentView.swift
//  LongPress
//
//  Created by Bruneau on 9/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LongPressDemo()
    }
}

struct LongPressDemo: View {
    @State private var scale = 1.0
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 50, height: 50)
            .scaleEffect(scale)
            .animation(.spring(), value: scale)
            .onLongPressGesture(minimumDuration: 0.1) {
                print("pressed")
            } onPressingChanged: { pressing in
                if pressing {
                    scale = 10
                    print("is pressing")
                }else{
                    scale = 1
                    print("stopped pressing")
                }
            }
    }
}

#Preview {
    ContentView()
}
