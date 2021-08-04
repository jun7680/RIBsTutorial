//
//  MainViewInteractor.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/04.
//

import RIBs
import RxSwift

protocol MainViewRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol MainViewPresentable: Presentable {
    var listener: MainViewPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainViewListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainViewInteractor: PresentableInteractor<MainViewPresentable>, MainViewInteractable, MainViewPresentableListener {

    weak var router: MainViewRouting?
    weak var listener: MainViewListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MainViewPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
