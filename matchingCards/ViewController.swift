//
//  ViewController.swift
//  matchingCards
//
//  Created by JWang on 11/4/18.
//  Copyright © 2018 Jun Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emojis = ["👻", "🎃", "🧛‍♂️", "🧙‍♂️", "🧚‍♀️", "🦇", "👩‍👧", "😱", "🤖"]
    
    lazy var game = CardMatching(numberOfCards: (cardButtons.count + 1) / 2)
    
    var flips = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flips)"
        }
    }
    
    
    var emojiChoices = [String]()
    emojiChoices.append(emojis)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("clicked \(sender.currentTitle ?? "testing")")
        
        flips += 1
        
        if let cardIdx = cardButtons.index(of: sender) {
            game.chooseCard(at: cardIdx)
            
            updateViewFromModel()
        } else {
            print("\(sender) not in cardButtons")
        }
    
    }
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game = CardMatching(numberOfCards: (cardButtons.count + 1) / 2)
        emojiDict = [Int:String]()
        
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for idx in cardButtons.indices {
            let button = cardButtons[idx]
            
            let card = game.cards[idx]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    var emojiDict = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emojiDict[card.id] == nil, emojiChoices.count > 0 {
            
            let rand = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDict[card.id] = emojiChoices.remove(at: rand)
        }
        
        // replacing the above
        return emojiDict[card.id] ?? "?"
    }
    
    
    
    

    /**
     Following not used in this proj
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

