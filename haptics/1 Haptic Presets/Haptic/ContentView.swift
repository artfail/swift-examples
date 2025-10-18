//
//  ContentView.swift
//  Haptic Presets
//
//  Created by Bruneau on 9/17/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Feedback()
    }
}

struct Feedback: View {
    
    
    let feedback:[SensoryFeedback] = [.alignment, .increase, .decrease, .levelChange, .pathComplete, .selection, .success, .warning, .error]
    
    let feedbackNames = ["alignment", "increase", "decrease", "level change", "path complete", "selection", "success", "warning", "error"]
    
    
    @State private var flip = Array(repeating: false, count: 9)
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
            
            ForEach(0 ..< feedback.count) { i in
                
                Button(feedbackNames[i]) {
                    flip[i].toggle()
                }
                .buttonStyle(BlueButton())
                .sensoryFeedback(feedback[i], trigger: flip[i])
            }
        }
    }
}



//https://www.hackingwithswift.com/quick-start/swiftui/customizing-button-with-buttonstyle
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


#Preview {
    ContentView()
}
