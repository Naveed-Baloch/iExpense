//
//  AddView.swift
//  iExpense
//
//  Created by Naveed on 20/08/2024.
//

import Foundation
import SwiftUI

struct AddView: View{
    var expenses: Expenses
    @State private var name = ""
    @State private var amount = 0.0
    @State private var type = ExpenseType.personal
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type, content: {
                    ForEach(ExpenseType.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                })
                
                TextField("Amount", value: $amount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .toolbar{
                if(!name.isEmpty && amount > 0.0) {
                    Button("Save") {
                        let expense = ExpenseItem(id: UUID(), name: name, type: type, amount: amount)
                        expenses.items.append(expense)
                        dismiss()
                    }
                } else  {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add New Expense")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    AddView(expenses: Expenses())
}
