//
//  ContentView.swift
//  Memorize
//
//  Created by Марина on 30.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount = 12
    var body: some View {
        NavigationStack {
            Spacer()
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120))]) {
                let emojis = ["😈", "🎃", "👻" ,"👁", "🫀", "👩‍🦳","😈", "🎃", "👻" ,"👁", "🫀", "👩‍🦳", ]
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
//                        .aspectRatio(contentMode: .fit)
                }
            }
            .foregroundColor(.orange)
        }
            
//            .padding()
            .navigationTitle("Memorize")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
   @State var isFaceup = true //create a pointer
    let content: String
    
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 5)
            
            Group {
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceup ? 1 : 0)
            
            baseRectangle.fill().opacity(isFaceup ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceup.toggle()
        }
    }
}
