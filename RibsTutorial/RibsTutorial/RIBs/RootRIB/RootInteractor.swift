//
//  RootInteractor.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func rootToLoggedOut()
    func rootToMainView()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootListener: AnyObject {
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?
    
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        router?.rootToLoggedOut()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}


extension RootInteractor: RootInteractable {
    func goToMainView() {
        print("goto main3")
        router?.rootToMainView()
    }
}
