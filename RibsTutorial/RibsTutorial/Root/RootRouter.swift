//
//  RootRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        loggedOutBuilder: LoggedOutBuildable,
        loggedInBuilder: LoggedInBuildable
    ) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()

    }
    
    // MARK: - Private
    
    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable

    private var loggedOut: ViewableRouting?
    
    func routeToLoggedIn(withPlayer1Name player1Name: String, player2Name: String) {
        if let loggedOut = self.loggedOut {
            detachChild(loggedOut)
            viewController.replaceModal(viewController: nil)
            self.loggedOut = nil
        }
        
//        let loggedIn = loggedInBuilder.build(withListener: interactor)
//        attachChild(loggedIn)
    }
}
