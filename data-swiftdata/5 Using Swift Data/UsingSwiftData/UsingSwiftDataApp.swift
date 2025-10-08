//
//  UsingSwiftDataApp.swift
//  UsingSwiftData
//
//  Created by Bruneau on 9/29/25.
//

import SwiftData
import SwiftUI

@main
struct UsingSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self) // SwiftData container class
    }
}
