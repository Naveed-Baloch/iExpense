//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Naveed on 20/08/2024.
//

import Foundation


struct ExpenseItem: Identifiable {
    let id: UUID
    let name: String
    let type: ExpenseType
    let double: Double
}

enum ExpenseType: String, CaseIterable {
    case personal = "Personal", business = "Business"
}
