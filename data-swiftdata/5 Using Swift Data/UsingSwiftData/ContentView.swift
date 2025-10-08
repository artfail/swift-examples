//
//  ContentView.swift
//  UsingSwiftData
//
//  Created by Bruneau on 9/29/25.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.dateCreated, order: .reverse) private var notes: [Note]
    
    var body: some View {
        HStack{
            Button("Good"){
                context.insert(Note(title: "Good", content: "Today was a good day"))
                try? context.save()
            }.font(.largeTitle).padding()
            
            Button("Bad"){
                context.insert(Note(title: "Bad", content: "Today was a bad day"))
                try? context.save()
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
