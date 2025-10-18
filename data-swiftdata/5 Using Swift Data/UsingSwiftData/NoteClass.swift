//
//  NoteClass.swift
//  UsingSwiftData
//
//  Created by Bruneau on 9/29/25.
//
import SwiftData
import Foundation //needed for date

@Model          //used to define the data models that SwiftData will manage and store
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
