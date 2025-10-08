//
//  FirstView.swift
//  Views
//
//  Created by Bruneau on 9/28/25.
//
import SwiftUI

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
