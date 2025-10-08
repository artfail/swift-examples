//
//  ContentView.swift
//  Environment
//
//  Created by Bruneau on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.locale) var locale
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            if colorScheme == .dark {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 200, height: 200
                    )
                    .foregroundColor(.white)
            }
            else{
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 200, height: 200
                    )
                    .foregroundColor(.black)
            }
        }
        .padding()
        .onAppear(){
            print(locale)
            print(colorScheme)
        }
    }
}

#Preview {
    ContentView()
}
