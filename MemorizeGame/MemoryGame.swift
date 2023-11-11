//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 王蒙 on 30/10/2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter {index in cards[index].isFaceUp}.only
//            let faceUpCardIndices = cards.indices.filter {index in cards[index].isFaceUp}
//            return faceUpCardIndices.count == 1 ? faceUpCardIn dices.first : nil
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
        }
        set {
            cards.indices.forEach{cards[$0].isFaceUp = (newValue == $0)}
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
        }
    }
    
    mutating func choose(_ card: Card) {
        // we can not just use card.isFaceUp.toggle() because this card is immutable,
        // it's just a copy (because it's a struct type), so we should use cards[index] to modify (by reference)
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                        cards[potentialMatchIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
//                    indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
//                    for index in cards.indices {
//                        cards[index].isFaceUp = false
//                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
//                cards[chosenIndex].isFaceUp.toggle()
                cards[chosenIndex].isFaceUp = true
            }
        }
        
    }
    
//    private func index(of card: Card) -> Int? {
//        for index in cards.indices {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil    // FIXME: bogus!
//    }
    
    // Modifying Value Types from Within Instance Methods
    // Structures and enumerations are value types. By default, the properties of a value type can’t be modified from within its instance methods.
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        // The following is used to judge in which situation the two cards will be regarded as equal
        // it is equivalent to overriding method "equals" in Java
        // if all the attributes are equatable, then the Swift will make this struct or class equatable, so no need to write the following code
        
//        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content)"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
