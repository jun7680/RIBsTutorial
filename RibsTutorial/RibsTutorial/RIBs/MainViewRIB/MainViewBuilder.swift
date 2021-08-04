//
//  MainViewBuilder.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/04.
//

import RIBs

protocol MainViewDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MainViewComponent: Component<MainViewDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MainViewBuildable: Buildable {
    func build(withListener listener: MainViewListener) -> MainViewRouting
}

final class MainViewBuilder: Builder<MainViewDependency>, MainViewBuildable {

    override init(dependency: MainViewDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainViewListener) -> MainViewRouting {
        let component = MainViewComponent(dependency: dependency)
        let viewController = MainViewViewController()
        let interactor = MainViewInteractor(presenter: viewController)
        interactor.listener = listener
        return MainViewRouter(interactor: interactor, viewController: viewController)
    }
}
