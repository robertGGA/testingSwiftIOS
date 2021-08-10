//
//  ViewController.swift
//  application
//
//  Created by Robert Gadelshin on 06.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Game(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet {
            counterLabel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🦊", "🐻", "🐻‍❄️", "🐷", "🦆", "🐒", "🐗"]
    
    var emojiDictionary = [Int: String]()
    
    func updateViewFromModal() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiCard(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatch ? #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 0) : #colorLiteral(red: 0, green: 0.4914051294, blue: 0.936558187, alpha: 1)
                
            }
        }
    }
    
    func emojiCard(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }


    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func actionButton(_ sender: UIButton) {
        touches += 1
        if let indexEmoji = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: indexEmoji)
            updateViewFromModal()
        }
    }
}
