//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 王蒙 on 30/10/2023.
//  ViewModel

//import SwiftUI

//func createCardContent(forPairAtIndex index: Int) -> String {
//    return ["👻", "🎃", "😈", "💀", "👻", "🎃", "😈", "💀"][index]
//}
//class EmojiMemoryGame: ObservableObject {
//    // make emojis global but namespace it inside of the class
//    private static let emojis = ["👻", "🎃", "😈", "💀", "👻", "🎃", "😈", "💀"]
//
//    private static func createMemoryGame() -> MemoryGame<String> {
//        // trailing closure
//        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
//            if emojis.indices.contains(pairIndex) {
//                return emojis[pairIndex]
//            } else {
//                return "⁉️"
//            }
//        }
//    }
//
//    @Published private var model = createMemoryGame()
//
//    var cards: Array<MemoryGame<String>.Card> {
//        return model.cards
//    }
//
//    // MARK: Intents
//
//    func shuffle() {
//        model.shuffle()
//    }
//
//    func choose(_ card: MemoryGame<String>.Card) {
//        model.choose(card)
//    }
//}
