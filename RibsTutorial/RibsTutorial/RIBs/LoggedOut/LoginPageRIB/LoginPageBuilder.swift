//
//  LoginPageBuilder.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import RIBs

protocol LoginPageDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoginPageComponent: Component<LoginPageDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoginPageBuildable: Buildable {
    func build(withListener listener: LoginPageListener) -> LoginPageRouting
}

final class LoginPageBuilder: Builder<LoginPageDependency>, LoginPageBuildable {

    override init(dependency: LoginPageDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoginPageListener) -> LoginPageRouting {
        let component = LoginPageComponent(dependency: dependency)
        let viewController = LoginPageViewController()
        let interactor = LoginPageInteractor(presenter: viewController)
        interactor.listener = listener
        return LoginPageRouter(interactor: interactor, viewController: viewController)
    }
}
