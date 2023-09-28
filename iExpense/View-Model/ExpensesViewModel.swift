//
//  ExpensesViewModel.swift
//  iExpense
//
//  Created by Isaque da Silva on 18/07/23.
//

import Foundation

extension ExpensesView {
    class ExpensesViewModel: ObservableObject {
        let manager = ExpenseManager.shared
        
        @Published var items = [ExpensesItems]()
        @Published var typeOfExpenses: TypeOfExpenses = .personal
        @Published var showingExpenses = false
        
        var totalOfExpenses: Double {
            var total: Double = 0
            
            for value in items {
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
        
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter
        }
        
        var search: [ExpensesItems] {
            items.filter { $0.type.contains(typeOfExpenses.rawValue) }
        }
        
        func getItems() {
            DispatchQueue.main.async {
                Task {
                    self.items = await self.manager.items
                }
            }
        }
        
        func removeItems(at indexSet: IndexSet) {
            DispatchQueue.main.async {
                Task {
                    await self.manager.removeRows(at: indexSet)
                }
                self.getItems()
            }
        }
        
        func formatNumberToCurrency(value: Double) -> String {
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            
            return formatter.string(from: NSNumber(value: value)) ?? "No Value"
        }
        
        init() {
            getItems()
        }
    }
}
