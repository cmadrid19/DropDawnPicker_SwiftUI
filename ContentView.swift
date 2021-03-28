//
//  ContentView.swift
//  DropDawnPicker
//
//  Created by Maxim Macari on 28/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedCandy") var candySelected: String = "Caramels"
    
    enum Candies: String, CaseIterable {
        case marshmallows
        case caramels
        case chocolates
        case Cotton
        case Gumdrops
    }
    
    
    var body: some View {
        VStack{
            DropDawnPicker(title: "Candies",
                           selection: $candySelected,
                           options: Candies.allCases.map { $0.rawValue.capitalized })
            
            Image("\(candySelected.lowercased())")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()

            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


