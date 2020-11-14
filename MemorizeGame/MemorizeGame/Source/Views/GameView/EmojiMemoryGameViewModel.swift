//
//  EmojiMemoryGameViewModel.swift
//  MemorizeGame
//
//  Created by Parth Adroja on 13/10/20.
//  Copyright © 2020 Mobiquity. All rights reserved.
//

import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    
    @Published private var model: MemoryGameModel<String> = EmojiMemoryGameViewModel.createGame()
    
    private static func createGame() -> MemoryGameModel<String> {
        let emojis = ["🚀", "🍺", "🏀", "👨🏻‍💻", "🎃", "👻", "🚓", "🧁", "🚁"]
        return MemoryGameModel<String>(numberOfPairs: emojis.count) { emojis[$0] }
    }
    
    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }
    
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGameViewModel.createGame()
    }
}
