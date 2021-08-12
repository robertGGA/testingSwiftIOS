//
//  Game.swift
//  application
//
//  Created by Robert Gadelshin on 08.08.2021.
//

import Foundation

class Game {
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "numberOfPairsOfCards must be higher than 0")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            mashupCards()
            
        }
    }
    
    private func mashupCards() {
        var randomizeFirst = 0
        var randomizeSecond = 0
        while randomizeFirst == randomizeSecond {
            if  cards.count > 2 {
            randomizeFirst = Int(arc4random_uniform(UInt32(cards.count)))
            randomizeSecond = Int(arc4random_uniform(UInt32(cards.count)))
                let bridge = cards[randomizeFirst]
                cards[randomizeFirst] = cards[randomizeSecond]
                cards[randomizeSecond] = bridge
            } else {
                break
            }
        }
    }
    private(set) var cards = [Card]()
    
    private var indexOfOneReversedCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatch {
            if let matchingIndex = indexOfOneReversedCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[index].isMatch = true
                    cards[matchingIndex].isMatch = true
                }
                cards[index].isFaceUp = true
            }  else {
                indexOfOneReversedCard = index
            }
        }
    }
}
