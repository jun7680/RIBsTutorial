//
//  PlayerType.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import UIKit

enum PlayerType: Int {
    case player1 = 1
    case player2

    var color: UIColor {
        switch self {
        case .player1:
            return UIColor.red
        case .player2:
            return UIColor.blue
        }
    }
}

