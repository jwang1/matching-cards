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
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("clicked \(sender.currentTitle ?? "testing")")
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

