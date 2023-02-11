//
//  DetailNotesView.swift
//  Notes
//
//  Created by Manuel Rodriguez Sebastian on 11/2/23.
//

import SwiftUI

struct DetailNotesView: View {
    @Environment(\.presentationMode) var presentation

    @StateObject var viewModel: DetailNotesViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Título")
                        TextField("Título", text: $viewModel.note.title)
                    }
                    HStack {
                        Text("Contenido")
                        Spacer()
                    }
                    TextEditor(text: $viewModel.note.content)
                        .frame(height: 200)
                        .border(Color.gray.opacity(0.2), width: 1.0)
                        .cornerRadius(3.0)
                    Spacer().frame(height: 20)
                    if viewModel.isEditing {
                        Button(action: {
                            self.viewModel.removeNote()
                            presentation.wrappedValue.dismiss()
                        }, label: {
                            Label(title: {
                                Text("Eliminar").foregroundColor(.white).bold()
                            }, icon: {
                                Image(systemName: "trash").foregroundColor(.white)
                            })
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(8)
                    }
                    Spacer()
                }
            }.padding()
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.viewModel.saveNote()
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Text(viewModel.isEditing ? "Actualizar" : "Guardar")
                })
            }
        }
    }
}

struct DetailNotesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNotesView(viewModel: DetailNotesViewModel())
    }
}
