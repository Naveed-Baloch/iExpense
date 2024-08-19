//
//  ContentView.swift
//  iExpense
//
//  Created by Naveed on 19/08/2024.
//

import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var count = UserDefaults.standard.integer(forKey: "Count")
    var body: some View {
        Button("Count is \(count)"){
            count += 1
            UserDefaults.standard.set(count, forKey: "Count")
        }
    }

}

#Preview {
    ContentView()
}
