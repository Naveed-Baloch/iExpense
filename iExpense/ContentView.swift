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
    @State private var user = User()
    @State private var showSheet = false
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            Button("OpenSheet") {
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            BottomSheet(name: "Bottom Sheet Properties")
        }
    }
}

struct BottomSheet: View {
    let name :String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.red
            VStack{
                Text(name)
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
