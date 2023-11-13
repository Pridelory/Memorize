//
//  ContentView.swift
//  Memorize
//
//  Created by 王蒙 on 13/09/2023.
//  EmojiMemoryGameView

//import SwiftUI
//
//struct EmojiMemoryGameView: View {
//    @ObservedObject var viewModel : EmojiMemoryGame
//
//    var body: some View {
//        VStack {
//            // 此种大括号初始化方式为trailing closure 尾随闭包，所以可以直接用大括号
//            ScrollView {
//                cards
//                    .animation(.default, value: viewModel.cards)
//            }
//            Button("Shuffle") {
//                viewModel.shuffle()
//            }
//        }
//        .padding()
//    }
//
//    var cards: some View {
//        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65), spacing: 0)], spacing: 0) {
//            ForEach(viewModel.cards) { card in
//                CardView(card)
//                    .aspectRatio(2/3, contentMode: .fit)
//                    .padding(4)
//                    .onTapGesture {
//                        viewModel.choose(card)
//                    }
//            }
//        }
//        .foregroundColor(.orange)
//    }
//}
//
//struct CardView: View {
//    let card: MemoryGame<String>.Card
//
//    init(_ card: MemoryGame<String>.Card) {
//        self.card = card
//    }
//
//    var body: some View {
//        // an important case using the closure
//        ZStack() {
//            // type inference
//            let base = RoundedRectangle(cornerRadius: 12)
//            Group {
//                base.fill(.white)
//                base.strokeBorder(lineWidth: 2)
//                Text(card.content)
//                    .font(.system(size: 200))
//                    .minimumScaleFactor(0.01)
//                    .aspectRatio(1, contentMode: .fit)
//            }
//            .opacity(card.isFaceUp ? 1 : 0)
//            base.fill()
//                .opacity(card.isFaceUp ? 0 : 1)
//        }
//        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//    }
//}
//
//struct EmojiMemoryGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
//        }
//    }
//}
