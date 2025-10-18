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
    //print(uid) //If you want to use the generated user id
    let db = Firestore.firestore()
    let user = "myusername" //We can replace this with a proper login later
    
    //Some placeholder data
    //[String: Any] is a dictionary that has Strings for the keys but the values can be all different types
    let postData: [String: Any] = [
        "user": user,
        "title": "House Post",
        "content": "I like this house",
        "timestamp": FieldValue.serverTimestamp()
    ]

    db.collection("posts")
      //.document(uid) //You can add these lines if you want to orginize a larger tree
      //.collection("messages")
      .addDocument(data: postData) { error in
        if let error = error {
            print("Post failed: \(error.localizedDescription)")
        } else {
            print("Message posted successfully!")
        }
    }
}
