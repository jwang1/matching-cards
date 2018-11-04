//
//  Card.swift
//  matchingCards
//
//  Created by JWang on 11/4/18.
//  Copyright © 2018 Jun Wang. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    init(identifier id : Int) {
        self.id = id
    }
}
