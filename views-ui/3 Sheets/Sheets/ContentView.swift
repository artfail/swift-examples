//
//  ContentView.swift
//  Sheets
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ShowSignUp()
    }
}

struct ShowSignUp: View {
    @State var showingSheet = false
    
    var body: some View {
        VStack{
            Image(systemName:"star.fill").foregroundStyle(Color.green).padding()
            Button(action: {showingSheet.toggle()}){
                Text("Sign Up")
            }
        }.font(.title)
        
        .sheet(isPresented: $showingSheet,
               onDismiss: didDismiss) {
            VStack {
                Image(systemName:"heart").foregroundStyle(Color.red).padding()
                Button("Dismiss") { showingSheet.toggle() }
            }.font(.title)
        }
    }

    func didDismiss() {
        print("Dismissed")
    }
}

#Preview {
    ContentView()
}
