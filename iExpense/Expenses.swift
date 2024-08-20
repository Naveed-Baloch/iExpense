//
//  Expenses.swift
//  iExpense
//
//  Created by Naveed on 20/08/2024.
//

import Foundation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "MyItems")
            }
        }
    }
    
    init() {
        if let savedJsonItems = UserDefaults.standard.data(forKey: "MyItems") {
            if let expenses = try? JSONDecoder().decode([ExpenseItem].self, from: savedJsonItems) {
                items = expenses
                return
            }
        }
        items = []
    }
}
