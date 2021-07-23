//
//  ScoreStream.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RxSwift
import RxRelay

public struct Score {
    public let player1Score: Int
    public let player2Score: Int
    
    public static func equals(lhs: Score, rhs: Score) -> Bool {
        return lhs.player1Score == rhs.player1Score && lhs.player2Score == rhs.player2Score
    }
}

protocol ScoreStream: AnyObject {
    var score: Observable<Score> { get }
}


protocol MutableScoreStream: ScoreStream {
    func updateScore(with winner: PlayerType)
}

class ScoreStreamImpl: MutableScoreStream {

    public init() {}

    public var score: Observable<Score> {
        return variable
            .asObservable()
            .distinctUntilChanged { (lhs: Score, rhs: Score) -> Bool in
                Score.equals(lhs: lhs, rhs: rhs)
            }
    }

    func updateScore(with winner: PlayerType) {
        let newScore: Score = {
            let currentScore = variable.value
            switch winner {
            case .player1:
                return Score(player1Score: currentScore.player1Score + 1, player2Score: currentScore.player2Score)
            case .player2:
                return Score(player1Score: currentScore.player1Score, player2Score: currentScore.player2Score + 1)
            }
        }()
        variable.accept(newScore)
    }

    // MARK: - Private

    private let variable = BehaviorRelay<Score>(value: Score(player1Score: 0, player2Score: 0))
}
