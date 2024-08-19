//
//  ContentView.swift
//  iExpense
//
//  Created by Naveed on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("count") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            print(UserDefaults.standard.integer(forKey: "count"))
        }
    }
}

#Preview {
    ContentView()
}
