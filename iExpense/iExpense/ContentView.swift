//
//  ContentView.swift
//  iExpense
//
//  Created by Isaque da Silva on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var typeOfExpenses: TypeOfExpenses = .personal
    @State private var showingExpenses = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Type of Expenses") {
                    Picker("Type of Expenses", selection: $typeOfExpenses) {
                        ForEach(TypeOfExpenses.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .listRowBackground(Color(CGColor(red: 240, green: 240, blue: 246, alpha: 0)))
                
                Section("Expenses:") {
                    
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button(action: {
                    showingExpenses = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    VStack {
                        Text("Total \(typeOfExpenses.rawValue) Expenses: 300")
                            .font(.subheadline.bold())
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("Total Expenses: 300")
                            .font(.subheadline.bold())
                            .foregroundColor(.gray)
                    }
                }
            }
            .sheet(isPresented: $showingExpenses) {
                AddExpenseView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
