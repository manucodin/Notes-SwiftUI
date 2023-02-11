//
//  DetailNotesViewModel.swift
//  Notes
//
//  Created by Manuel Rodriguez Sebastian on 11/2/23.
//

import Foundation
import SwiftUI

class DetailNotesViewModel: ObservableObject {
    @Published var note: Note
    let isEditing: Bool
    
    private let dataSource = NotesDataSource()
    
    init(_ note: Note = Note(), isEditing: Bool = false) {
        self.note = note
        self.isEditing = isEditing
    }
    
    func saveNote() {
        dataSource.saveNote(note)
    }
    
    func removeNote() {
        dataSource.removeNote(note)
    }
}
