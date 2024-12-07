//
//  NoteDetailView.swift
//  CollaborativeNotesAp
//
//  Created by Mario Tetelepta  on 12/7/24.
//


import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Environment(\.modelContext) private var context
    @Bindable var note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Title", text: $note.title)
                .font(.title)
                .padding(.bottom)
            TextEditor(text: $note.content)
                .frame(maxHeight: .infinity)
        }
        .padding()
        .navigationTitle("Edit Note")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
                    // Changes are automatically saved in SwiftData
                }
            }
        }
    }
}