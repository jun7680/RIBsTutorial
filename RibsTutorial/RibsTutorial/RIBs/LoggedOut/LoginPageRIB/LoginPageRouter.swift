//
//  LoginPageRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import RIBs

protocol LoginPageInteractable: Interactable {
    var router: LoginPageRouting? { get set }
    var listener: LoginPageListener? { get set }
}

protocol LoginPageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoginPageRouter: ViewableRouter<LoginPageInteractable, LoginPageViewControllable>, LoginPageRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoginPageInteractable, viewController: LoginPageViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
