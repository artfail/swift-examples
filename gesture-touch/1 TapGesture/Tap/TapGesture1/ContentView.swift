//
//  ContentView.swift
//  Tap Gesture
//
//  Created by Bruneau on 9/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TapDemo()
    }
}

struct TapDemo: View {
    @State private var tapped = false
    var body: some View {
        ZStack{
            if tapped{
                Color.green.ignoresSafeArea()
            }else{
                Color.cyan.ignoresSafeArea()
            }
            
            Circle()
                .fill(Color.red)
                .frame(width: 60, height: 60)
                /*.onTapGesture {
                    print("tapped")
                    tapped.toggle()
                }
                 */
                
                .onTapGesture (count:2) {
                    tapped.toggle()
                }
                
            Text("Tap").foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
