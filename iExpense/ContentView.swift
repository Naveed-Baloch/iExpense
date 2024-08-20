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
    @State private var showAddView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(expanses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeExpense)
            }
            .toolbar(content: {
                if (!expanses.items.isEmpty) {
                    EditButton()
                }
                
                Button("Add", systemImage: "plus"){
                    showAddView.toggle()
                }
            })
            .navigationTitle("IExpense")
            .sheet(isPresented: $showAddView, content: {
                AddView(expenses: expanses)
            })
        }
    }
    
    func removeExpense(at offset: IndexSet) {
        expanses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
