//
//  MemoryGameThemeModel.swift
//  MemorizeGame
//
//  Created by 王蒙 on 12/11/2023.
//

import Foundation

struct MemoryGameThemeModel {
    
    static var themes: [Theme] = [
        Theme(name: "Fruit", color: "RED", numberOfPairs: 2, emojis: ["🍎", "🍐", "🍌", "🍇", "🍓", "🍑", "🍊", "🫐", "🥝", "🍅", "🥭"]),
        Theme(name: "Animal", color: "YELLOW", numberOfPairs: 2, emojis: ["🐶", "🐭", "🐹", "🐰", "🦊", "🐼", "🐷", "🐸", "🐒", "🐔", "🐧"]),
        Theme(name: "Sport", color: "GREEN", numberOfPairs: 2, emojis: ["⚽️", "🏀", "🏈", "⚾️", "🏓", "🏸", "🎱", "🥏", "🪀", "🏒"]),
        Theme(name: "Transport", color: "BLUE", numberOfPairs: 2, emojis: ["🚗", "🚒", "🚄", "🛩", "🚀", "🛸", "🚁", "🛳", "🚇", "🛵", "🚲"]),
        Theme(name: "Flag", color: "GREY", numberOfPairs: 2, emojis: ["🇨🇳", "🇨🇦", "🇧🇷", "🇦🇷", "🇻🇬", "🇨🇮", "🇩🇪", "🇭🇰", "🇮🇱", "🇯🇵", "🇷🇺", "🇰🇷"]),
        Theme(name: "People", color: "ORANGE", numberOfPairs: 2, emojis: ["🪂", "🏋️‍♀️", "⛹️", "🏌️‍♂️", "🧘‍♂️", "🏊", "🚣", "🚴‍♂️", "🧗", "⛷", "🤼‍♂️"]),
    ]
    
    static func selectTheme(at index: Int) -> Theme? {
        guard index >= 0 && index < themes.count else {
            return nil
        }
        return themes[index]
    }
    
    struct Theme {
        let name: String
        let color: String
        let numberOfPairs: Int
        let emojis: [String]
    }
}
