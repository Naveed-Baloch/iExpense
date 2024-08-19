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
    
    var body: some View {
        VStack{
            
            if let user {
                Text("User \(user.name) ; \(user.email)")
            }
            
            Button("Save User ") {
                let encoder = JSONEncoder()
                let tempUser = User(name: "Test", email: "test@gmail.com")
                if let data = try? encoder.encode(tempUser) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            
            Button("Fetch User ") {
                let decoder = JSONDecoder()
                if let userData = UserDefaults.standard.data(forKey: "UserData") {
                    if let decodedUser = try? decoder.decode(User.self, from: userData) {
                        user = decodedUser
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
