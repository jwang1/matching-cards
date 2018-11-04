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
            
            cards.append(card)
            // putting a thing into Array, or taking things out of Array, also copies
            cards.append(card)
            
        }
    }
}
