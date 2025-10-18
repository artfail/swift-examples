//
//  Post.swift
//  As1
//
//  Created by Bruneau on 10/6/25.
//

//Make a new Post
import FirebaseAuth
import FirebaseFirestore

func postMessage() {
    guard let uid = Auth.auth().currentUser?.uid else { //Checks if the uid is valid
        print("User not signed in")
        return
    }
    print(uid) //If you want to use the generated user id
    
    let db = Firestore.firestore()
    let user = "myusername" //We can replace this with a proper login later
    
    
//The postData var can be setup like a dictionary that can be easily formatted to a JSON style string. Dont use capitals for the field names.
    
    let postData: [String: Any] = [
        "user": user,
        "title": "House Post", // Some placeholder data
        "content": "I like this house",
        "timestamp": FieldValue.serverTimestamp()
    ]

// Add our postData var to the database under posts
// Print the error if there was a problem

    db.collection("posts")
      .addDocument(data: postData) { error in
        if let error = error {
            print("Post failed: \(error.localizedDescription)")
        } else {
            print("Message posted successfully!")
        }
    }
}
