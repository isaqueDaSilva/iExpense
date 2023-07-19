//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Isaque da Silva on 19/07/23.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dimiss
    @State private var name = ""
    @State private var typeOfExpense: TypeOfExpenses = .personal
    @State private var amount: Double = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section("Expense:") {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $typeOfExpense) {
                        ForEach(TypeOfExpenses.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                VStack{
                    Button("Add", action: {
                        dimiss()
                    })
                    .frame(maxWidth: 430)
                    .buttonStyle(.borderedProminent)
                }
                .listRowBackground(Color(CGColor(red: 240, green: 240, blue: 246, alpha: 0)))
            }
            .navigationTitle("New Expense:")
            .toolbar {
                Button(action: {
                    dimiss()
                }, label: {
                    Text("Close")
                })
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
