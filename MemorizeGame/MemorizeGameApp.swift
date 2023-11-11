//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by 王蒙 on 11/11/2023.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
