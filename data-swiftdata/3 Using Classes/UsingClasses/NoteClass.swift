//
//  NoteClass.swift
//  UsingClasses
//
//  Created by Bruneau on 9/28/25.
//

import Foundation //needed for date

class Note: Identifiable {
    var title: String
    var content: String
    var dateCreated: Date

    init(title: String, content: String, dateCreated: Date = Date()) {
        self.title = title
        self.content = content
        self.dateCreated = dateCreated
    }
}
