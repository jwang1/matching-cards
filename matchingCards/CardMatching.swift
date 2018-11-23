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
    
    init(numberOfCards: Int) {
        for _ in 1...numberOfCards {
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
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
}
