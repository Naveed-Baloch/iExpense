//
//  AddView.swift
//  iExpense
//
//  Created by Naveed on 20/08/2024.
//

import Foundation
import SwiftUI

enum ExpenseType: String, CaseIterable {
    case personal = "Personal", business = "Business"
}

struct AddView: View{
    @State private var name = ""
    @State private var amount = 0.0
    @State private var type = ExpenseType.personal
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type, content: {
                    ForEach(ExpenseType.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                })
                
                TextField("Amount", value: $amount,format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add New Expense")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    AddView()
}
