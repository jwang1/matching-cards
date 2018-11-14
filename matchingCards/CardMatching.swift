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
        
    }
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
}
