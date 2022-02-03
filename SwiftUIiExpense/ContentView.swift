//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 02/02/2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }.onDelete(perform: removeItems)
            }.navigationTitle("IExpense")
                .toolbar {
                    Button {
                        showingAddExpenses = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }.sheet(isPresented: $showingAddExpenses) {
            AddView(expenses: expenses)
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
