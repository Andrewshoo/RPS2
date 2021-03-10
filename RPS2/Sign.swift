//
//  Sign.swift
//  RPS2
//
//  Created by Andrey Shutyuk on 10.03.2021.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .sciccors
    }
}

enum Sign {
    case rock, paper, sciccors
    
    func getResult (for opposite: Sign) ->GameState {
        
        switch self {
        case.paper:
            switch opposite{
            case .paper:
                return .draw
            case .rock:
                return .win
            case .sciccors:
                return .lose
            }
        case .rock:
            switch opposite {
            case .paper:
                return .lose
            case .rock:
                return .draw
            case .sciccors:
                return .win
            }
        case .sciccors:
            switch opposite {
            case .paper:
                return .win
            case .rock:
                return .lose
            case .sciccors:
                return .draw
            }
        }
    }
}
