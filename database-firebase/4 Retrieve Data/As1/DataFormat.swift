//
//  PostStruct.swift
//  As1
//
//  Created by Bruneau on 10/6/25.
//
/*  When retrieving data from Firestore, we first need to define our data object. This is a struct that we formatted to hold our data when the Snapshot comes back from the server. Identifiable means this type must have a stable ID. This lets us use ForEach loops on it later. Codable allows this struct to be easily encoded into an external data format like JSON. @DocumentID Lets us grab the ID from the parent. This eliminates the need for the redundant storage of IDs in the data itself. */

import FirebaseFirestore

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    let title: String
    let content: String
    let user: String
}
