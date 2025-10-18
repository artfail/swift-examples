//
//  ContentView.swift
//  As1
//
//  Created by Bruneau on 10/5/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var status: String = ""
    @State private var isSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            if isSignedIn {
                Text("Signed in!")
                Text("Welcome, \(email)")
            } else {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                HStack{
                    Button("Sign Up") {
                        signUp()
                    }
                    
                    .buttonStyle(.bordered)
                    Button("Sign In") {
                        signIn()
                    }
                    .buttonStyle(.borderedProminent)
                }
                Text(status)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
    
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                status = "Signin failed: \(error.localizedDescription)"
            } else {
                isSignedIn = true
                status = "Signed in as \(email)"
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                status = "Signup failed: \(error.localizedDescription)"
            } else {
                status = "Account created!"
            }
        }
    }
}

#Preview {
    ContentView()
}
