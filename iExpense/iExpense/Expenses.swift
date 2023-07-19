//
//  Expenses.swift
//  iExpense
//
//  Created by Isaque da Silva on 18/07/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpensesItems]() {
        didSet {
            if let encoderItems = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoderItems, forKey: "Items")
            }
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoderItems = try? JSONDecoder().decode([ExpensesItems].self, from: saveItems) {
                items = decoderItems
                return
            }
        }
        items = []
    }
}
