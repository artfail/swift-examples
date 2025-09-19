//
//  ContentView.swift
//  ForEach
//
//  Created by Bruneau on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        }.onAppear(){
            //sandBox1()
            sandBox2()
        }
    }
}

func sandBox1(){
    var person = ["John", "47", "New York"]

    //person[0] = "bob"
    
    person.forEach { value in
        print("\(value)")
    }
}

func sandBox2(){
    var person = ["name": "John", "age": "47", "city": "New York"]
    
    person ["name"] = "bob";

    for i in person{
        print("\(i.key): \(i.value)")
    }
    
    person.forEach { key, value in
        print("\(key): \(value)")
    }
    
   
}

#Preview {
    ContentView()
}
