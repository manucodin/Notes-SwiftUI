//
//  NotesDataSource.swift
//  Notes
//
//  Created by Manuel Rodriguez Sebastian on 11/2/23.
//

import Foundation

class NotesDataSource {
    private let userDefaults = UserDefaults.standard
    private let notesKey = "notes"
    
    public func saveNote(_ note: Note) {
        var currentNotes = getNotes()
        
        if currentNotes.contains(where: { $0.id == note.id }) {
            currentNotes.removeAll(where: { $0.id == note.id })
            currentNotes.append(note)
        } else {
            currentNotes.append(note)
        }
        
        guard let notesData = try? JSONEncoder().encode(currentNotes) else { return }
        
        userDefaults.set(notesData, forKey: notesKey)
    }
    
    public func removeNote(_ note: Note) {
        var currentNotes = getNotes()
        currentNotes.removeAll(where: { $0.id == note.id })
        
        guard let notesData = try? JSONEncoder().encode(currentNotes) else { return }
        
        userDefaults.set(notesData, forKey: notesKey)
    }
    
    public func getNotes() -> [Note] {
        guard let notesData = userDefaults.data(forKey: notesKey) else { return [] }
        guard let notes = try? JSONDecoder().decode([Note].self, from: notesData) else { return [] }
        
        return notes
    }
}
