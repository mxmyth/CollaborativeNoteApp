//
//  CollaborativeNotesApApp.swift
//  CollaborativeNotesAp
//
//  Created by Mario Tetelepta  on 12/7/24.
//

import SwiftUI
import SwiftData

@main
struct CollaborativeNotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Note.self, configurations: [
                    .init(initialData: preloadDummyData)
                ])
        }
    }
}

private func preloadDummyData(context: ModelContext) {
    let exampleNotes = [
        Note(title: "First Note", content: "This is a dummy note."),
        Note(title: "SwiftUI & SwiftData", content: "Showcase their simplicity and power."),
        Note(title: "Collaborative App", content: "This is an example of a collaborative app.")
    ]
    exampleNotes.forEach { context.insert($0) }
}
