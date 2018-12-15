//
//  Card.swift
//  matchingCards
//
//  Created by JWang on 11/4/18.
//  Copyright © 2018 Jun Wang. All rights reserved.
//

import Foundation

struct Card : Hashable {
    
    var hashValue: Int {
        return id
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    var isFaceUp = false
    var isMatched = false
    
    private var id: Int
    
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.id = Card.getUniqueIdentifier()
    }
    
}
