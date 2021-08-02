//
//  LoggedOutRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import RIBs

protocol LoggedOutInteractable: Interactable {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable> {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedOutInteractable, viewController: LoggedOutViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension LoggedOutRouter: LoggedOutRouting {
    
    func nextPage() {
        <#code#>
    }
}
