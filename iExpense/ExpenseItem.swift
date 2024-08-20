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
    let type: String
    let double: Double
}
