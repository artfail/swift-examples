//
//  ContentView.swift
//  Text Input
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        singInForm()
    }
}

struct singInForm: View {
    
    @State var username = ""
    @State var password = ""
    
    private var isFormValid: Bool {
        !username.trimmingCharacters(in: .whitespaces).isEmpty &&
        !password.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        VStack {
            Form {
                TextField(text: $username) {
                    Text("Username")
                }
                SecureField(text: $password) {
                    Text("Password")
                }
                
                Button("Submit") {
                    print(username);
                    print(password);
                }
                .disabled(!isFormValid)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}


#Preview {
    ContentView()
}
