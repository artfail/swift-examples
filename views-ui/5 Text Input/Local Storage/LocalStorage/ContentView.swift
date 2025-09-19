//
//  ContentView.swift
//  LocalStorage
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("USERNAME") var savedName = ""
    
    var body: some View {
        if savedName.isEmpty{
            singInForm(savedName: $savedName)
        }else{
            welcome(savedName: $savedName)
        }
    }
}

struct singInForm: View {
    
    @State var username = ""
    @State var password = ""
    @Binding var savedName: String
    
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
                    savedName = username
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


struct welcome: View {
    
    @Binding var savedName: String
    
    var body: some View {
        Text("Welcome " + savedName).font(.title)
        Button("Sign Out") {
            savedName = ""
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ContentView()
}
