//
//  ContentView.swift
//  iExpense
//
//  Created by Naveed on 19/08/2024.
//

import SwiftUI

struct User: Codable {
    let name : String
    let email: String
}

struct ContentView: View {
    @State private var user : User? = nil
    
    @State private var expanses = Expenses()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expanses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeExpense)
            }
            .toolbar(content: {
                EditButton()
                Button("Add"){
                    let expanse = ExpenseItem(id: UUID(), name: "Food", type: ExpenseType.personal, double: 12.0)
                    expanses.items.append(expanse)
                }
            })
            .navigationTitle("IExpense")
        }
    }
    
    func removeExpense(at offset: IndexSet) {
        expanses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
