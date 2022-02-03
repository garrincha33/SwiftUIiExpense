//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 02/02/2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }.onDelete(perform: removeItems)
            }.navigationTitle("IExpense")
                .toolbar {
                    Button {
                        let expense = ExpenseItems(name: "test", type: "personal", amount: 5)
                        expenses.items.append(expense)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
    
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
