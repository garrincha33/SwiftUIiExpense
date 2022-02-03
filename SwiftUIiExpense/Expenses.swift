//
//  Expenses.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 03/02/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItems]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
                
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
    
    
    
}
