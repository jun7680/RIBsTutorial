//
//  RootRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {

    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOutRouting: LoggedOutRouting?
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuilder
    ) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
}

extension RootRouter: RootRouting {
    
    func rootToLoggedOut() {
        let loggedOutRouting = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouting = loggedOutRouting
        attachChild(loggedOutRouting)
        
        viewController.uiviewController.present(loggedOutRouting.viewControllable.uiviewController, animated: true, completion: nil)
    }
    
}
