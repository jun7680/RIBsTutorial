//
//  LoggedInRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs

protocol LoggedInInteractable: Interactable {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoggedInRouter: ViewableRouter<LoggedInInteractable, LoggedInViewControllable>, LoggedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedInInteractable, viewController: LoggedInViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
