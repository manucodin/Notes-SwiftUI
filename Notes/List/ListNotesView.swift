//
//  ContentView.swift
//  Notes
//
//  Created by Manuel Rodriguez Sebastian on 11/2/23.
//

import SwiftUI

struct ListNotesView: View {
    
    @State var createNote: Bool = false
    @StateObject var viewModel = ListNotesViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                List(viewModel.notes) { note in
                    NavigationLink(destination: {
                        DetailNotesView(viewModel: DetailNotesViewModel(note, isEditing: true))
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(note.title)
                            Text(note.readableDate).font(.subheadline)
                        }
                    })
                }
            }
            .onAppear {
                self.viewModel.fetchNotes()
            }
            .navigationTitle("Notas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        DetailNotesView(viewModel: DetailNotesViewModel())
                    }, label: {
                        Text("Crear")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListNotesView(viewModel: ListNotesViewModel())
    }
}
