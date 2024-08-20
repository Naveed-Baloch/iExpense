import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showAddView = false

    var body: some View {
        NavigationStack {
            ZStack {
                if expenses.items.isEmpty {
                    Text("You don't have any expenses. \n Try adding now!")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        let personalExpenses = expenses.items.filter { item in item.type == .personal }
                        let businessExpenses = expenses.items.filter { item in item.type == .business }
                        
                        if !personalExpenses.isEmpty {
                            Section(header: Text("Personal Expenses")) {
                                ForEach(personalExpenses) { item in
                                    ExpenseRow(item: item)
                                }
                                .onDelete { indexSet in
                                    removeExpense(at: indexSet, from: personalExpenses)
                                }
                            }
                        }

                        if !businessExpenses.isEmpty {
                            Section(header: Text("Business Expenses")) {
                                ForEach(businessExpenses) { item in
                                    ExpenseRow(item: item)
                                }
                                .onDelete { indexSet in
                                    removeExpense(at: indexSet, from: businessExpenses)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                if !expenses.items.isEmpty {
                    EditButton()
                }

                Button {
                    showAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("IExpense")
            .sheet(isPresented: $showAddView) {
                AddView(expenses: expenses)
            }
        }
    }

    func removeExpense(at offsets: IndexSet, from filteredExpenses: [ExpenseItem]) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: {  item in item.id == filteredExpenses[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }
}

struct ExpenseRow: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type.rawValue)
                    .font(.subheadline)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(item.amount <= 10 ? .green : item.amount < 100 ? .orange : .red)
                .bold()
        }
    }
}

#Preview {
    ContentView()
}
