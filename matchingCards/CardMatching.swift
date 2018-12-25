//
//  CardMatching.swift
//  matchingCards
//
//  Created by JWang on 11/4/18.
//  Copyright © 2018 Jun Wang. All rights reserved.
//

import Foundation
  
struct CardMatching {
    
    private(set) var cards = [Card]()
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
        
            cards += [card, card]
        }
        
        shuffleCards()
    }
    
    mutating func shuffleCards() {
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
    var idxOfOneAndOnlyFacedUpCard: Int? {
        get {
            
            // using trailing-closure, and extension on Collection sequence type
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnlyOne()

            
//            var foundIdx: Int?
//            for idx in cards.indices {
//                if cards[idx].isFaceUp {
//                    if foundIdx == nil {  // no cards up
//                        foundIdx = idx
//                    } else {
//                        return nil // already had a card up, and current card with idx is also up; hence, idxOfOneAndOnlyFacedUpCard will be nil
//                    }
//                }
//            }
//            return foundIdx
 
        }
        set {
            for idx in cards.indices {
                cards[idx].isFaceUp = (idx == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIdx = idxOfOneAndOnlyFacedUpCard, matchingIdx > 0 {
                if cards[matchingIdx] == cards[index] {
                    cards[matchingIdx].isMatched = true
                    cards[index].isMatched = true
                    
                }
                
                cards[index].isFaceUp = true                
            } else {
                idxOfOneAndOnlyFacedUpCard = index
            }
        }
    }

}


/*
 * Add oneAndOnlyOne method to Collection sequence type
 */
extension Collection {
    func oneAndOnlyOne() -> Element? {
        return count == 1 ? first : nil
    }
}

