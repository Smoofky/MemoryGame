//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var cardNumber: Int = 6
    @State var disabled : Bool = false
    let columns = [GridItem(.adaptive(minimum: 120)), GridItem(.flexible())]
    let icons = ["👁️","🧠", "🦷" ,"☠️" ,"🥶","😭","👁️","🧠", "🦷" ,"☠️" ,"🥶","😭"]
    var cardAdd : some View {
        adjustCardNumber(by: 2, symbol: "+") .disabled(cardNumber >= icons.count)
    }
    var cardRemove : some View {
        adjustCardNumber(by: -2, symbol: "-").disabled(cardNumber <= 2)
    }
    var cardDisplay : some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<cardNumber, id: \.self){ index in CardView(isFlipped: true, icon: icons[index])}
        } .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
    }
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        
        Button(
            action : {
                
                    cardNumber += offset
                
            } ,
            label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 25) .fill(.white) .strokeBorder(.blue, lineWidth: 2) .frame(width: 50, height: 50)
                    Text(symbol).font(.largeTitle)
                }
                
            }) //.disabled(cardNumber <= 2 || cardNumber > icons.count)
    }
    
    var body: some View {
        VStack {
            ScrollView{
                cardDisplay
            }
            
            Spacer()
            HStack
            {
                cardAdd
                Spacer()
                cardRemove
                
            }
        }
    }}

#Preview {
    ContentView()
}
