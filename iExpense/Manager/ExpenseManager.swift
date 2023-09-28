//
//  ExpenseManager.swift
//  iExpense
//
//  Created by Isaque da Silva on 27/09/23.
//

import Foundation

actor ExpenseManager {
    static let shared = ExpenseManager()
    
    var items = [ExpensesItems]() {
        didSet {
            if let encoderItems = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoderItems, forKey: "Items")
            }
        }
    }
    
    func appendItens(name: String, type: TypeOfExpenses, date: Date, amount: Double) {
        let item = ExpensesItems(name: name, type: type.rawValue, date: date, amount: amount)
        items.append(item)
    }
    
    func removeRows(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    private init() { 
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoderItems = try? JSONDecoder().decode([ExpensesItems].self, from: saveItems) {
                items = decoderItems
                return
            }
        }
        items = []
    }
}
