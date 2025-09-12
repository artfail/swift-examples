//
//  ContentView.swift
//  Arrays
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        }.onAppear(){
            sandBox()
        }
    }
}

func sandBox() {
    
    var pets = ["Pig", "Chicken", "Rat"]

    print(pets.count)
    
    //var pets: [String] = ["Pig", "Chicken", "Rat"]

    //pets.append("Dog")
    //pets.remove(at: 0)
    //pets.insert("Cat", at: 1)
    //pets.reverse()
    //pets.sort()
    //print(pets)
    
    /*
    if let intdex = pets.firstIndex(of: "Rat"){
        print(intdex)
    }
    */
     
    /*
    for i in (0 ..< pets.count) {
        print ("\(i) = " + pets[i])
    }*/
    
    for i in pets{
        print (i)
    }
    
    
    

}

#Preview {
    ContentView()
}
