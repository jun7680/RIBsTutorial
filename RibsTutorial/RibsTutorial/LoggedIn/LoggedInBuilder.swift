//
//  LoggedInBuilder.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    fileprivate var loggedInViewController: LoggedInViewControllable {
        
        return dependency.loggedInViewController
    }

    fileprivate var games: [Game] {
        return shared {
            return [RandomWinAdapter(dependency: self), TicTacToeAdapter(dependency: self)]
        }
    }

    var mutableScoreStream: MutableScoreStream {
        return shared { ScoreStreamImpl() }
    }

    var scoreStream: ScoreStream {
        return mutableScoreStream
    }

    let player1Name: String
    let player2Name: String

    init(dependency: LoggedInDependency, player1Name: String, player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener, player1Name: String, player2Name: String) -> (router: LoggedInRouting, actionableItem: LoggedInActionableItem)
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener, player1Name: String, player2Name: String) -> (router: LoggedInRouting, actionableItem: LoggedInActionableItem) {
        let component = LoggedInComponent(dependency: dependency,
                                          player1Name: player1Name,
                                          player2Name: player2Name)
        let interactor = LoggedInInteractor(games: component.games)
        interactor.listener = listener

        let offGameBuilder = OffGameBuilder(dependency: component)
        let router = LoggedInRouter(interactor: interactor,
                                    viewController: component.loggedInViewController,
                                    offGameBuilder: offGameBuilder)
        return (router, interactor)
    }
}
