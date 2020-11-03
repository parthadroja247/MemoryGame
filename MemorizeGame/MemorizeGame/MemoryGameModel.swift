//
//  MemoryGameModel.swift
//  MemorizeGame
//
//  Created by Parth Adroja on 13/10/20.
//  Copyright © 2020 Mobiquity. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    
    private var indexOfFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for index in 0..<numberOfPairs {
            let content = cardContentFactory(index)
            cards.append(Card(id: index*2, content: content))
            cards.append(Card(id: index*2+1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFaceUpCard = chosenIndex
            }
        }
    }
}
