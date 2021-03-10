//
//  ViewController.swift
//  RPS2
//
//  Created by Andrey Shutyuk on 10.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var sciccorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var countPl = 0
    var countOp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view.
    }
    
    func start() {
        statusLabel.text = "Rock, Paper, Sciccors ?"
        view.backgroundColor = UIColor.brown
        appSign.text = "🤖"
        playAgainButton.isHidden = true
        paperButton.isHidden = false
        rockButton.isHidden = false
        sciccorsButton.isHidden = false
        paperButton.isEnabled = true
        rockButton.isEnabled = true
        sciccorsButton.isEnabled = true
        reset()
    }
    
    func play (opposite: Sign) {
        
        let appTurn = randomSign()
        
        switch appTurn {
        case .paper:
            appSign.text = "✋"
        case .rock:
            appSign.text = "👊"
        case .sciccors:
            appSign.text = "✌️"
        }
        
        switch opposite.getResult(for: appTurn){
        case.win:
            statusLabel.text = "You win!"
            countPl += 1
        case .start:
            start()
        case .lose:
            statusLabel.text = "You lose!"
            countOp += 1
        case .draw:
            statusLabel.text = "Draw"
        }
        
        self.resultLabel.text = "\(countPl):\(countOp)"
        
        outCome()
    }
    
    func outCome() {
        if (countPl == 3){
            view.backgroundColor = UIColor.blue
            statusLabel.text = "You win the game! Try again"
        } else if (countOp == 3) {
            view.backgroundColor = UIColor.red
            statusLabel.text = "You lose the game! Try again"
        }
    }
    
    func reset() {
        
        if (countPl == 3) {
            countPl = 0
            countOp = 0
        } else if (countOp == 3) {
            countPl = 0
            countOp = 0
        }
        self.resultLabel.text = "\(countPl):\(countOp)"
    }
    
    func chooseButton(choose: Sign) {
        
        switch choose {
        case .paper:
            rockButton.isHidden = true
            sciccorsButton.isHidden = true
            paperButton.isHidden = false
            playAgainButton.isHidden = false
            paperButton.isEnabled = false
        case .rock:
            rockButton.isHidden = false
            sciccorsButton.isHidden = true
            paperButton.isHidden = true
            playAgainButton.isHidden = false
            rockButton.isEnabled = false
        case.sciccors:
            rockButton.isHidden = true
            sciccorsButton.isHidden = false
            paperButton.isHidden = true
            playAgainButton.isHidden = false
            sciccorsButton.isEnabled = false
        }
        
    }
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        chooseButton(choose: .rock)
        play(opposite: .rock)
    }
    
    @IBAction func paperButtonTapped(_ sender: Any) {
        chooseButton(choose: .paper)
        play(opposite: .paper)
    }
    
    @IBAction func sciccorsButtonTapped(_ sender: Any) {
        chooseButton(choose: .sciccors)
        play(opposite: .sciccors)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        start()
    }
    
    
}

