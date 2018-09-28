//
//  ViewController.swift
//  Guessing Game
//
//  Created by Sawyer Cherry on 9/21/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInputBox: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var announceBar: UILabel!
    @IBOutlet weak var buttonColor2: UISwitch!
    @IBOutlet weak var colorChange2: UISwitch!
    
    var genNumber = Int(arc4random_uniform(99) + 1)
    var numOfTries = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputBox.keyboardType = .numberPad
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        announceBar.text = ""
        
        guard button.currentTitle! != "Restart" else {
            genNumber = Int(arc4random_uniform(99) + 1)
            numOfTries = 10
            button.setTitle("Run The Number", for: .normal)
            announceBar.text = ""
            tryLabel.text = ""
            userInputBox.text = ""
            return
        }
        
        guard let userNum = Int(userInputBox.text!) else  {
            announceBar.text = "Guess a Number"
            return
        }
        
        guard userNum >= 1 && userNum <= 100 else {
            announceBar.text = "GUESS BETWEEN 1 & 100"
            return
        }
        
        userInputBox.text = ""
        
        if userNum > genNumber {
            announceBar.text = "Your guess was too high"
        }
        if userNum < genNumber {
            announceBar.text = "Your guess was too low"
        }
        if userNum == genNumber {
            announceBar.text = "You have guessed the correct number"
            button.setTitle("Restart", for: .normal)
        }
        
        numOfTries -= 1
        tryLabel.text = "You Have \(numOfTries) Tries Left."
        
        if numOfTries == 0 && userNum != genNumber {
            button.setTitle("Restart", for: .normal)
            announceBar.text = "Is this what loss feels like?"
            tryLabel.text = "Well that sucks..."
        }
    }
}

