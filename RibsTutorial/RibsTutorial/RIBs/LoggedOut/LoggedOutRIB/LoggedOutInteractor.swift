//
//  LoggedOutInteractor.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
    func nextPage()
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
}

protocol LoggedOutListener: AnyObject {
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?
    
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

extension LoggedOutInteractor: LoggedOutPresentableListener {
    func nextPage() {
        router?.nextPage()
    }    
}
