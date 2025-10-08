//
//  ContentView.swift
//  As1
//
//  Created by Bruneau on 10/5/25.
//

/*  We can make a @state var for our posts. This will be an array of the type Post that we defined. We will also register a listener. This listener will activate when information on the server changes. This lets us update our view when new information is available and not rely on a button to activate the query or be constantly refreshing. */

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @State private var posts: [Post] = []
    @State private var listener: ListenerRegistration?
    
    var body: some View {
        VStack {
            Text("Posts").font(.title)
            if posts.isEmpty {
                Text("No posts available.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(posts) { post in //List here operates like a ForEach, looping through every post in posts
                    VStack(alignment: .leading, spacing: 4) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.content)
                        Text("By \(post.user)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            
            Button("Post") {
                postMessage()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            signIn() //Runs our authentication function
            startListening() //Adds our listener
        }
        .onDisappear {
            listener?.remove()  //Removes our listener if the view changes
        }  //This prevents a memory leak
    }
    
    //This function retrieves data from the server
    func startListening() {
        let db = Firestore.firestore()
        
        //Our listener looks for changes to the posts collection
        listener = db.collection("posts")
            .order(by: "timestamp", descending: true)  //It returns the items in that collection based on when it was posted (timestamp)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error listening: \(error.localizedDescription)")
                    return
                }
    //This takes the data that is returned and encodes it in the format of the Post struct we created.
    //It then adds it to the posts array.
                posts = snapshot?.documents.compactMap {
                    try? $0.data(as: Post.self)
                } ?? []
    //If it fails, it returns an empty array
                print("Loaded \(posts.count) posts")
            }
    }
}

#Preview {
    ContentView()
}

