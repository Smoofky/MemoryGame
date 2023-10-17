//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var cardNumber: Int = 3
    let icons = ["1", "2", "3"]
    
    var body: some View {
        VStack {
            VStack {
                CardView(isFlipped: true, icon: "x")
                CardView(isFlipped: true, icon: "x")
                CardView(isFlipped: true, icon: "x")
            }
            .padding()
            
            HStack {
                adjustCardNumber(by: -1, symbol: "+")
            }
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        return Button(
            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
            label: {Text("Button")}
        )
    }
}

#Preview {
    ContentView()
}
