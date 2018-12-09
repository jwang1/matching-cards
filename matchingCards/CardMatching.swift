//
//  CardMatching.swift
//  matchingCards
//
//  Created by JWang on 11/4/18.
//  Copyright © 2018 Jun Wang. All rights reserved.
//

import Foundation
  
class CardMatching {
    
    var cards = [Card]()
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
        
            cards += [card, card]
        }
        
        // TODO: shuffle the cards,
        shuffleCards()
    }
    
    func shuffleCards() {
        var last = cards.count - 1
        
        while(last > 0) {
            // Note the Random number is from the currently # of element
            // the last is reducing every time; trying to get uniform dist
            let rand = Int(arc4random_uniform(UInt32(last)))
            
            cards.swapAt(last, rand)
            
            last -= 1
        }
    }
    
    // tracking the card when only 1 card is facing up
    var idxOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIdx = idxOfOneAndOnlyFacedUpCard, matchingIdx > 0 {
                if cards[matchingIdx].id == cards[index].id {
                    cards[matchingIdx].isMatched = true
                    cards[index].isMatched = true
                    
                }
                
                cards[index].isFaceUp = true
                idxOfOneAndOnlyFacedUpCard = nil
                
            } else {
                // either no cards or two cards were facing up
                for flipDownIdx in cards.indices {
                    cards[flipDownIdx].isFaceUp = false
                }
                    
                cards[index].isFaceUp = true
                idxOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
}
