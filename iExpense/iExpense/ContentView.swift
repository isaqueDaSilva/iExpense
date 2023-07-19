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
    
    var totalOfExpenses: Double {
        var total: Double = 0
        
        for value in expenses.items {
            total += value.amount
        }
        
        return total
    }
    
    var totalOfCurrentExpense: Double {
        var total: Double = 0
        
        if typeOfExpenses == .business || typeOfExpenses == .personal {
            for value in search {
                total += value.amount
            }
        }
        
        return total
    }
    
    var search: [ExpensesItems] {
        expenses.items.filter { $0.type.contains(typeOfExpenses.rawValue) }
    }
    
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
                if !expenses.items.isEmpty {
                    Section("Expenses:") {
                        ForEach(search) { item in
                            HStack {
                                Text(item.name)
                                    .font(.headline.bold())
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                        }
                        .onDelete(perform: removeRows)
                    }
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
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    VStack {
                        Text("Total Amount of \(typeOfExpenses.rawValue) Expenses: \(totalOfCurrentExpense, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                            .font(.subheadline.bold())
                            .foregroundColor(.gray)

                        Spacer()

                        Text("Total Amount of Expenses: \(totalOfExpenses, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
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
    
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
