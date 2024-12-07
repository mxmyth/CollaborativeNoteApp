//
//  AddNoteView.swift
//  CollaborativeNotesAp
//
//  Created by Mario Tetelepta  on 12/7/24.
//


import SwiftUI
import SwiftData

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content)
                    .frame(height: 200)
            }
            .navigationTitle("New Note")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addNote()
                        dismiss()
                    }
                }
            }
        }
    }

    private func addNote() {
        let newNote = Note(title: title, content: content)
        context.insert(newNote)
    }
}
