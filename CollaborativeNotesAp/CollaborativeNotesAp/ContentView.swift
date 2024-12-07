//
//  ContentView.swift
//  CollaborativeNotesAp
//
//  Created by Mario Tetelepta  on 12/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \.timestamp, order: .reverse) private var notes: [Note]
    @State private var isAddingNote = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .lineLimit(1)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        withAnimation {
                            isAddingNote.toggle()
                        }
                    } label: {
                        Label("Add Note", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNote) {
                AddNoteView()
            }
        }
    }

    private func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            context.delete(notes[index])
        }
    }
}
