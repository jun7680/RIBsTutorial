//
//  LoginPageInteractor.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import RIBs
import RxSwift

protocol LoginPageRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoginPagePresentable: Presentable {
    var listener: LoginPagePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoginPageListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoginPageInteractor: PresentableInteractor<LoginPagePresentable>, LoginPageInteractable, LoginPagePresentableListener {

    weak var router: LoginPageRouting?
    weak var listener: LoginPageListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoginPagePresentable) {
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
