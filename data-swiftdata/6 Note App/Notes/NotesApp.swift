//
//  NotesApp.swift
//  Notes
//
//  Created by Bruneau on 9/28/25.
//

import SwiftUI
import SwiftData

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self) // SwiftData container class
    }
}
