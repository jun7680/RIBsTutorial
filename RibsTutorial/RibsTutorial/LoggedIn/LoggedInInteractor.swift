//
//  LoggedInInteractor.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs
import RxSwift


protocol LoggedInRouting: Routing {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func cleanupViews()
    func routeToOffGame(with games: [Game])
    func routeToGame(with gameBuilder: GameBuildable)
}

protocol LoggedInPresentable: Presentable {
    var listener: LoggedInPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedInListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable, LoggedInActionableItem {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(games: [Game]) {
        self.games = games
        super.init()
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        router?.routeToOffGame(with: games)
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }

    // MARK: - OffGameListener

    func startGame(with gameBuilder: GameBuildable) {
        router?.routeToGame(with: gameBuilder)
    }

    // MARK: - TicTacToeListener

    func gameDidEnd(with winner: PlayerType?) {
        router?.routeToOffGame(with: games)
    }

    // MARK: - LoggedInActionableItem

    func launchGame(with id: String?) -> Observable<(LoggedInActionableItem, ())> {
        let game: Game? = games.first { game in
            return game.id.lowercased() == id?.lowercased()
        }

        if let game = game {
            router?.routeToGame(with: game.builder)
        }

        return Observable.just((self, ()))
    }

    // MARK: - Private

    private var games = [Game]()

}
