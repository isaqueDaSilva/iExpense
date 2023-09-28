//
//  DetailView.swift
//  iExpense
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct DetailView: View {
    let name: String
    let type: String
    let date: String
    let amount: String
    
    var body: some View {
        List {
            HStack {
                Text("Name:")
                Spacer()
                Text(name)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Type:")
                Spacer()
                Text(type)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Amount:")
                Spacer()
                Text(date)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Amount:")
                Spacer()
                Text(amount)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Details")
    }
}
