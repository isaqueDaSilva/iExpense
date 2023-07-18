//
//  ContentView.swift
//  iExpense
//
//  Created by Isaque da Silva on 17/07/23.
//

import SwiftUI

//class Items: ObservableObject {
//    @Published var name = "Product"
//}

struct SegundaView: View {
    @Environment(\.dismiss) var dismiss
    var itens = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(itens, id: \.self) {
                        Text($0)
                    }
                }
                Button("Fechar", action: {
                    dismiss()
                })
            }
            .navigationTitle("Itens")
        }
    }
}

struct ContentView: View {
    @State private var item = ""
    @State private var showingNextPage = false
    @State private var itensAdicionados = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Insira um novo item à lista:")
                    
                    TextField("Insira um item", text: $item)
                    
                    Button("Adicionar", action: {
                        itensAdicionados.append(item)
                    })
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                List {
                    ForEach(itensAdicionados, id: \.self) {
                        Text($0)
                    }
                    .onDelete(perform: removeRow)
                }
            }
            .navigationTitle("Itens")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRow(at offsets: IndexSet) {
        itensAdicionados.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
