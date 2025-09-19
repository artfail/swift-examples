//
//  ContentView.swift
//  Drag2
//
//  Created by Bruneau on 9/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Offset W:\(Int(offset.width)), H:\(Int(offset.height))")
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { value in
                            offset = .zero
                        }
                )
        }
    }
}

#Preview {
    ContentView()
}
