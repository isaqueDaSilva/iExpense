//
//  Expenses.swift
//  iExpense
//
//  Created by Isaque da Silva on 18/07/23.
//

import Foundation

struct ExpensesItems: Identifiable {
    let id: UUID
    let name: String
    let type: String
    let amount: Double
}
