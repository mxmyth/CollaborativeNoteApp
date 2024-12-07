//
//  Note.swift
//  CollaborativeNotesAp
//
//  Created by Mario Tetelepta  on 12/7/24.
//


import SwiftData
import Foundation

@Model
class Note: Identifiable {
    @Attribute(.unique) var id: UUID
    var title: String
    var content: String
    var timestamp: Date

    init(id: UUID = UUID(), title: String, content: String, timestamp: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.timestamp = timestamp
    }
}
