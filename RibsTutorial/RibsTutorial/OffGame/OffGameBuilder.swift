//
//  OffGameBuilder.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs

protocol OffGameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var player1Name: String { get }
    var player2Name: String { get }
    var scoreStream: ScoreStream{ get }
}

final class OffGameComponent: Component<OffGameDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    var player1Name: String {
        return dependency.player1Name
    }

    var player2Name: String {
        return dependency.player2Name
    }

    var scoreStream: ScoreStream {
        return dependency.scoreStream
    }

}

// MARK: - Builder

protocol OffGameBuildable: Buildable {
    func build(withListener listener: OffGameListener) -> OffGameRouting
}

final class OffGameBuilder: Builder<OffGameDependency>, OffGameBuildable {

    override init(dependency: OffGameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OffGameListener) -> OffGameRouting {
        let component = OffGameComponent(dependency: dependency)
        let viewController = OffGameViewController()
        let interactor = OffGameInteractor(presenter: viewController)
        interactor.listener = listener
        return OffGameRouter(interactor: interactor, viewController: viewController)
    }
}
