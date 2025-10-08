//
//  ContentView.swift
//  Notes
//
//  Created by Bruneau on 9/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.dateCreated, order: .reverse) private var notes: [Note]
    @State private var showAddSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title).font(.headline)
                            Text(note.dateCreated, style: .date).font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { showAddSheet = true }) {
                        Label("Add Note", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddNoteView()
            }
        }
    }

    func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            context.delete(notes[index])
        }
        try? context.save()
    }
}

#Preview {
    ContentView()
}
