//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Isaque da Silva on 19/07/23.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AddExpensesViewModel
    
    var updateItemList: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                    
                    Picker("Type", selection: $viewModel.typeOfExpense) {
                        ForEach(TypeOfExpenses.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    
                    TextField("Amount", value: $viewModel.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                VStack{
                    Button("Add", action: {
                        viewModel.addExpense()
                        updateItemList()
                        dismiss()
                    })
                    .frame(maxWidth: 430)
                    .buttonStyle(.borderedProminent)
                }
                .listRowBackground(Color(CGColor(red: 240, green: 240, blue: 246, alpha: 0)))
            }
            .navigationTitle("New Expense:")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    })
                }
            }
        }
    }
    
    init(typeOfExpense: TypeOfExpenses, updateItemList: @escaping () -> Void) {
        self.updateItemList = updateItemList
        _viewModel = StateObject(wrappedValue: AddExpensesViewModel(typeOfExpense: typeOfExpense, updateItemList: updateItemList))
    }
}
