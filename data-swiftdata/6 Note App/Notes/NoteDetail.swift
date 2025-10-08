//
//  NoteDetail.swift
//  Notes
//
//  Created by Bruneau on 9/28/25.
//

import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Bindable var note: Note  // Bindable lets us edit the info that is stored
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            TextField("Title", text: $note.title)

            TextEditor(text: $note.content)
                .frame(height: 200)
        }
        .navigationTitle("Edit Note")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    try? context.save()  // Saves any changes to the model
                    dismiss()
                }
            }
        }
    }
}
