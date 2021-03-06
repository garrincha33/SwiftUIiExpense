//
//  ExpenseItems.swift
//  SwiftUIiExpense
//
//  Created by Richard Price on 03/02/2022.
//

import Foundation

struct ExpenseItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
