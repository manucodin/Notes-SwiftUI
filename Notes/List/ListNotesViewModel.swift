//
//  ListNotesViewModel.swift
//  Notes
//
//  Created by Manuel Rodriguez Sebastian on 11/2/23.
//

import Foundation
import SwiftUI

class ListNotesViewModel: ObservableObject {
    @Published var notes = [Note]()
    
    private let dataSource = NotesDataSource()
    
    func fetchNotes() {
        self.notes = dataSource.getNotes()
    }
}
