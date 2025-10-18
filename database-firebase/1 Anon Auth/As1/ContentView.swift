//
//  ContentView.swift
//  As1
//
//  Created by Bruneau on 10/5/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


struct ContentView: View {

    @State var status = "Signing in..."
    
    var body: some View {
        VStack {
            Text(status)
        }
        .onAppear {
            signIn()
        }
    }
    
    // Authenticate
    func signIn() {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                status = "Auth error: \(error.localizedDescription)"
            } else {
                status = "Signed in as anonymous user: \(result?.user.uid ?? "Unknown")"
            }
        }
    }
}


#Preview {
    ContentView()
}
