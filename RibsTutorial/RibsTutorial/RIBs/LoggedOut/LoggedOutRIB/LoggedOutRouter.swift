//
//  LoggedOutRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import RIBs

protocol LoggedOutInteractable: Interactable, LoginPageListener {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {
}

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable> {
    
    private let loginPageValidationBuilder: LoginPageBuildable
    private var loginPageValidationRouting: LoginPageRouting?
    
    init(interactor: LoggedOutInteractable,
         viewController: LoggedOutViewControllable,
         loginPageValidationBuilder: LoginPageBuildable
    ) {
        self.loginPageValidationBuilder = loginPageValidationBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension LoggedOutRouter: LoggedOutRouting {
    
    func nextPage() {
        let routing = loginPageValidationBuilder.build(withListener: interactor)
        self.loginPageValidationRouting = routing
        attachChild(routing)
        viewController.uiviewController.present(routing.viewControllable.uiviewController, animated: true, completion: nil)
    }
}
