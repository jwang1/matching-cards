//
//  ViewController.swift
//  matchingCards
//
//  Created by JWang on 11/4/18.
//  Copyright © 2018 Jun Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = CardMatching(numberOfCards: 8)
    
    var flips = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flips)"
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🧛‍♂️", "🧙‍♂️", "🧚‍♀️", "🦇", "👻", "🎃", "🧛‍♂️", "🧙‍♂️", "🧚‍♀️", "🦇"]
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("clicked \(sender.currentTitle ?? "testing")")
        
        flips += 1
        
        if let cardIdx = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardIdx], on: sender)
        } else {
            print("\(sender) not in cardButtons")
        }
        
        
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

