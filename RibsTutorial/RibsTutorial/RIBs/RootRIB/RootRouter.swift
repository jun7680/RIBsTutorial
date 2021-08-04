//
//  RootRouter.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, MainViewListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: IjViewControllerable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {

    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOutRouting: LoggedOutRouting?
    
    private let mainViewBuilder: MainViewBuildable
    private var mainViewRouting: MainViewRouting?
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuilder,
         mainViewBuilder: MainViewBuilder
    ) {
        self.loggedOutBuilder = loggedOutBuilder
        self.mainViewBuilder = mainViewBuilder
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
        viewController.presentNavi(viewController: loggedOutRouting.viewControllable)
        
    }
    
    func rootToMainView() {
        print("goto main4")
        if let loggedOutRouting = loggedOutRouting {
            print("goto main5")
            viewController.dismiss(viewController: loggedOutRouting.viewControllable, animated: false) {
                self.detachChild(loggedOutRouting)
                self.loggedOutRouting = nil
                
                
                // main view attach
                let mainViewRouting = self.mainViewBuilder.build(withListener: self.interactor)
                self.mainViewRouting = mainViewRouting
                self.attachChild(mainViewRouting)
                self.viewController.presentNavi(viewController: mainViewRouting.viewControllable)                
               
            }
        }
    }
    
}
