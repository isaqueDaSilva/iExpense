//
//  Expenses.swift
//  iExpense
//
//  Created by Isaque da Silva on 18/07/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpensesItems]()
}
