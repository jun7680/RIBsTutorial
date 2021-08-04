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

protocol LoginPageViewControllable: IjViewControllerable {
    
}

final class LoginPageRouter: ViewableRouter<LoginPageInteractable, LoginPageViewControllable>, LoginPageRouting {
    
    override init(interactor: LoginPageInteractable, viewController: LoginPageViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
