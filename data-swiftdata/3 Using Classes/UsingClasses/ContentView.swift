//
//  ContentView.swift
//  UsingClasses
//
//  Created by Bruneau on 9/28/25.
//

import SwiftUI

struct ContentView: View {
    var notes: [Note] = [
        Note(title: "Today", content: "Today was a good day"),
        Note(title: "9/28", content: "Today was tough")
    ]
    
    var body: some View {
        VStack {
            ForEach(notes) { note in
                VStack {
                    Text(note.title).font(.headline)
                    Text(note.content)
                    Text(note.dateCreated, style: .date).font(.caption)
                }.padding()
            }
        }
    }
}


#Preview {
    ContentView()
}
