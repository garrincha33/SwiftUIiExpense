//
//  Expenses.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 03/02/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItems]()
}
