//
//  ContentView.swift
//  UsingClasses
//
//  Created by Bruneau on 9/28/25.
//

import SwiftUI

struct ContentView: View {
    @State var notes: [Note] = []
    
    var body: some View {
        HStack{
            Button("Good"){
                notes.append(Note(title: "Good", content: "Today was a good day"))
            }.font(.largeTitle).padding()
            
            Button("Bad"){
                notes.append(Note(title: "Bad", content: "Today was a bad day"))
            }.font(.largeTitle).padding()
            
        }
        ScrollView{
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
}


#Preview {
    ContentView()
}
