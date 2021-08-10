//
//  Card.swift
//  application
//
//  Created by Robert Gadelshin on 08.08.2021.
//

import Foundation

struct Card {
    var isFaceUp :Bool = false
    var isMatch :Bool = false
    var identifier : Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1;
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}
