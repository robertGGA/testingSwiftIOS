//
//  Card.swift
//  application
//
//  Created by Robert Gadelshin on 08.08.2021.
//

import Foundation

struct Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card ) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
    var isFaceUp :Bool = false
    var isMatch :Bool = false
    private var identifier : Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1;
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}
