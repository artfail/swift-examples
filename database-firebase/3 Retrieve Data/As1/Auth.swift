//
//  Auth.swift
//  As1
//
//  Created by Bruneau on 10/6/25.

// Auth
// This is our Anonymous Sign-In Function. The user id is automatically generated.

import FirebaseAuth

func signIn() {
    Auth.auth().signInAnonymously { result, error in
        if let error = error {
            print("Auth error: \(error.localizedDescription)")
        } else {
            print("Signed in anonymously")
        }
    }
}
