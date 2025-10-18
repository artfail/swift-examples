//
//  ContentView.swift
//  Magnify
//
//  Created by Bruneau on 9/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var zoom = 0.0
    @State var lastZoom = 1.0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(zoom + lastZoom)
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            zoom = value.magnification - 1
                        }
                        .onEnded { value in
                            lastZoom += zoom
                            zoom = 0;
                        }
                )
            
            VStack {
                Text("Scale:\(Int(zoom + lastZoom))")
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
