//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 02/02/2022.
//

import SwiftUI

struct UnderTenDollars: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.mint)
            .font(.system(size: 15, weight: .bold))
    }
}

extension View {
    func style(for item: ExpenseItems) -> some View {
        if item.amount < 10 {
            return self.font(.system(size: 55, weight: .bold, design: .monospaced))
            
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
    
    func under10() -> some View {
        modifier(UnderTenDollars())
    }
}

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD")).style(for: item)
                    }
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
