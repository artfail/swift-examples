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


#Preview {
    ContentView()
}
