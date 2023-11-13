//
//  MemoryGameViewModel.swift
//  MemorizeGame
//
//  Created by 王蒙 on 12/11/2023.
//  ViewModel

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    // make emojis global but namespace it inside of the class
    private static let defaultEmojis = ["👻", "🎃", "😈", "💀", "👻", "🎃", "😈", "💀"]

    private static func createMemoryGame(_ numberOfPairsOfCards: Int, _ emojis: [String]) -> MemoryGameModel<String> {
        // trailing closure
        return MemoryGameModel(numberOfPairsOfCards) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }

    @Published private var model = createMemoryGame(16, defaultEmojis)

    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    var themeName: String = "Default"

    // MARK: Intents
    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let themeArr = MemoryGameThemeModel.themes
        if let randomTheme = themeArr.randomElement() {
            themeName = randomTheme.name
            model = MemoryGameViewModel.createMemoryGame(randomTheme.numberOfPairs, randomTheme.emojis)
            shuffle()
        }
    }
}
