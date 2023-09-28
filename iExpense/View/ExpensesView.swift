//
//  ContentView.swift
//  iExpense
//
//  Created by Isaque da Silva on 17/07/23.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject var viewModel = ExpensesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Type of Expenses", selection: $viewModel.typeOfExpenses) {
                    ForEach(TypeOfExpenses.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.top, .horizontal])
                
                List {
                    if !viewModel.items.isEmpty {
                        Section("Expenses:") {
                            ForEach(viewModel.search) { item in
                                NavigationLink(destination: {
                                    List {
                                        ListView(title: "Name:", description: item.name)
                                        ListView(title: "Type:", description: item.type)
                                        ListView(title: "Date:", description: viewModel.dateFormatter.string(from: item.date))
                                        
                                        HStack {
                                            Text("Amount:")
                                            Spacer()
                                            Text(viewModel.formatNumberToCurrency(value: item.amount))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .navigationTitle("Details")
                                }, label: {
                                    HStack {
                                        Text(item.name)
                                            .font(.headline.bold())
                                        
                                        Spacer()
                                        
                                        Text(viewModel.formatNumberToCurrency(value: item.amount))
                                            .foregroundColor(.gray)
                                    }
                                    .accessibilityElement()
                                    .accessibilityLabel(item.name)
                                    .accessibilityValue("\(viewModel.formatNumberToCurrency(value: item.amount))")
                                })
                            }
                            .onDelete(perform: viewModel.removeItems)
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        viewModel.showingExpenses = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    VStack {
                        Text("Total of \(viewModel.typeOfExpenses.rawValue) Expenses: \(viewModel.formatNumberToCurrency(value: viewModel.totalOfCurrentExpense))")
                            .font(.subheadline.bold())
                            .foregroundColor(.gray)

                        Text("Total of Expenses: \(viewModel.formatNumberToCurrency(value: viewModel.totalOfExpenses))")
                            .font(.subheadline.bold())
                            .foregroundColor(.gray)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingExpenses) {
                AddExpenseView(typeOfExpense: viewModel.typeOfExpenses, updateItemList: {
                    viewModel.getItems()
                })
            }
        }
    }
}
