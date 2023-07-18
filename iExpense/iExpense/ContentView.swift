//
//  ContentView.swift
//  iExpense
//
//  Created by Isaque da Silva on 17/07/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Default"
    @Published var lastName = "User"
}

struct SegundaView: View {
    @Environment(\.dismiss) var dismiss
    var name: String
    
    var body: some View {
        VStack {
            Text("Seja Bem-Vindo \(name)!")
            
            Button("Fechar", action: {
                dismiss()
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView: View {
    @StateObject private var user = User()
    
    @State private var showingNextPage = false
    
    var body: some View {
        VStack {
            Text("Insira seu nome:")
            
            TextField("Insira seu primeiro nome", text: $user.firstName)
            TextField("Insira seu ultimo nome", text: $user.lastName)
            
            Button("Proximo", action: {
                showingNextPage = true
            })
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showingNextPage) {
            SegundaView(name: "\(user.firstName) \(user.lastName)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
