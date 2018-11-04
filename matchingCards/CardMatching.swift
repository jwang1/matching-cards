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
        for cardNbr in 1...numberOfCards {
            let card = Card(identifier: cardNbr)
            
            // struct is copied when assigned, different from class
            let matchingCard = card
            
            cards.append(card)
            cards.append(matchingCard)
            
        }
    }
}
