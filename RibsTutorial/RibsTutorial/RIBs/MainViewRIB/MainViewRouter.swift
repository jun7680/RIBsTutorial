//
//  MainViewRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/04.
//

import RIBs

protocol MainViewInteractable: Interactable {
    var router: MainViewRouting? { get set }
    var listener: MainViewListener? { get set }
}

protocol MainViewViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MainViewRouter: ViewableRouter<MainViewInteractable, MainViewViewControllable>, MainViewRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: MainViewInteractable, viewController: MainViewViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
