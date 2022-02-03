//
//  AddView.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 03/02/2022.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "personal"
    @State private var amount = 0.0
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    
    let types = ["business", "personal"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
        
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItems(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
        }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
