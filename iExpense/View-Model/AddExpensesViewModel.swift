//
//  AddExpensesViewModel.swift
//  iExpense
//
//  Created by Isaque da Silva on 27/09/23.
//

import Foundation

extension AddExpenseView {
    class AddExpensesViewModel: ObservableObject {
        let manager = ExpenseManager.shared
        
        @Published var name = ""
        @Published var typeOfExpense: TypeOfExpenses
        @Published var date = Date.now
        @Published var amount: Double = 0
        
        var updateItemList: () -> Void
        
        func addExpense() {
            Task {
                await manager.appendItens(name: name, type: typeOfExpense, date: date, amount: amount)
            }
        }
        
        init(typeOfExpense: TypeOfExpenses, updateItemList: @escaping () -> Void) {
            self.updateItemList = updateItemList
            
            _typeOfExpense = Published(initialValue: typeOfExpense)
        }
    }
}
