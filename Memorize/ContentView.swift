//
//  ContentView.swift
//  Memorize
//
//  Created by Albert Jordan on 6/26/22.
//

import SwiftUI


var emojis = ["🚘","🚖","🛵","🚂","🚲","✈️","🚌","🚑","🚀","🚁","🚠","🛻","⛵️","🏍","🚒","🚓","🚎","🚠"]


struct ContentView: View {
    @State var emojiCount = 4

    var body: some View {
                
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:100.0))]) {
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                        CardView(content: emoji, isFaceUp: true).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
           
            Spacer()
            HStack {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        
        }
        .padding(.horizontal)
    }
        
    
    var add: some View {

        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
               
    }
    
    var remove: some View {

        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
               
    }

}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture(count: 1) {
            isFaceUp = !isFaceUp
        }
        
    }
        
}
    








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
