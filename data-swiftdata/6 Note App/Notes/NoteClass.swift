//
//  NoteClass.swift
//  Notes
//
//  Created by Bruneau on 9/28/25.
//

import SwiftData
import Foundation //needed for date

@Model
class Note {
    var title: String
    var content: String
    var dateCreated: Date

    init(title: String, content: String, dateCreated: Date = Date()) {
        self.title = title
        self.content = content
        self.dateCreated = dateCreated
    }
}
