//
//  Expenses.swift
//  iExpense
//
//  Created by Isaque da Silva on 18/07/23.
//

import Foundation

struct ExpensesItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let date: Date
    let amount: Double
    
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: amount)) ?? "No Value"
    }
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
