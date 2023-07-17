//
//  ContentView.swift
//  iExpense
//
//  Created by Isaque da Silva on 17/07/23.
//

import SwiftUI

class User {
    var firstName = "Default"
    var lastName = "User"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Insira seu nome:")
            
            TextField("Insira seu primeiro nome", text: $user.firstName)
            TextField("Insira seu ultimo nome", text: $user.lastName)
            
            Text("Seu nome: \(user.firstName) \(user.lastName)")
                .font(.subheadline.bold())
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
