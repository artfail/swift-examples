//
//  SecondView.swift
//  Views
//
//  Created by Bruneau on 9/30/25.
//

import SwiftUI

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
