//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Naveed on 20/08/2024.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let double: Double

}

enum ExpenseType: String, CaseIterable, Codable {
    case personal = "Personal", business = "Business"
}
