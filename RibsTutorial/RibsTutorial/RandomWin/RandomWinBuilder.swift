//
//  RandomWinBuilder.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs

protocol RandomWinDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var player1Name: String { get }
    var player2Name: String { get }
    var mutableScoreStream: MutableScoreStream { get }
}

final class RandomWinComponent: Component<RandomWinDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    fileprivate var player1Name: String {
        return dependency.player1Name
    }

    fileprivate var player2Name: String {
        return dependency.player2Name
    }

    fileprivate var mutableScoreStream: MutableScoreStream {
        return dependency.mutableScoreStream
    }
}

// MARK: - Builder

protocol RandomWinBuildable: Buildable {
    func build(withListener listener: RandomWinListener) -> RandomWinRouting
}

final class RandomWinBuilder: Builder<RandomWinDependency>, RandomWinBuildable {

    override init(dependency: RandomWinDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: RandomWinListener) -> RandomWinRouting {
        let component = RandomWinComponent(dependency: dependency)
        let viewController = RandomWinViewController()
        let interactor = RandomWinInteractor(presenter: viewController)
        interactor.listener = listener
        return RandomWinRouter(interactor: interactor, viewController: viewController)
    }
}
