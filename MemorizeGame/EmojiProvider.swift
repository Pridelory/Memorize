//
//  EmojiProvider.swift
//  Memorize
//
//  Created by 王蒙 on 19/09/2023.
//

import Foundation

class EmojiProvider {
    
    let vehiclesEmojis: Array<String> = ["🚗", "🚐", "🚛", "🚜", "🛵", "🛺", "🚍", "🚅", "🛩", "🚁",]
    let animalsEmojis: Array<String> = ["🐶", "🐭", "🐷", "🐵", "🐤", "🐴", "🦉", "🦐", "🐳", "🐎"]
    let fruitEmojis: Array<String> = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍒", "🍑"]
    
    var combinedArray: [String] = []
    
    init() {
        combinedArray = vehiclesEmojis + animalsEmojis + fruitEmojis
        shuffle()
    }
    
    func shuffle() {
        combinedArray.shuffle()
    }
}
