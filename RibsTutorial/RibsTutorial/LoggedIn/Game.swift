//
//  Game.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs

protocol GameListener: AnyObject {
    func gameDidEnd(with winner: PlayerType?)
}

protocol GameBuildable: Buildable {
    func build(withListener listener: GameListener) -> ViewableRouting
}

protocol Game {
    var id: String { get }
    var name: String { get }
    var builder: GameBuildable { get }
}
