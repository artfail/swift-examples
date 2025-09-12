//
//  ContentView.swift
//  Views
//
//  Created by Bruneau on 8/28/25.
//

import SwiftUI

struct ContentView: View {
    @State var showView2 = false

    var body: some View {
        VStack {
            if showView2 {
                SecondView(showSecondView: $showView2)
            } else {
                FirstView(showSecondView: $showView2)
            }
        }
    }
}

struct FirstView: View {
    @Binding var showSecondView: Bool

    var body: some View {
        ZStack {
            Color(red:0.9,green: 0.9,blue: 1)
            VStack {
                Image(systemName:"heart").foregroundStyle(Color.red).font(.title).padding()
                Text("View 1").font(.title)
                Button("Go View 2") {
                    showSecondView = true
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SecondView: View {
    @Binding var showSecondView: Bool
    
    var body: some View {
        ZStack {
            Color(red:0.9,green: 1,blue: 1)
            VStack {
                Image(systemName:"star.fill").foregroundStyle(Color.green).font(.title).padding()
                Text("View 2").font(.title)
                Button("Go View 1") {
                    showSecondView = false
                }
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    ContentView()
}
