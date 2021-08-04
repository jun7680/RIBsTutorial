//
//  LoginPageInteractor.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import RIBs
import RxSwift

protocol LoginPageRouting: ViewableRouting {
    
}

protocol LoginPagePresentable: Presentable {
    //뷰가 바라보는 리스터
    var listener: LoginPagePresentableListener? { get set }
    
}

//Router가 바라보는 리스터
protocol LoginPageListener: AnyObject {
    func previous()
    func goToMainView()
}

final class LoginPageInteractor: PresentableInteractor<LoginPagePresentable>, LoginPageInteractable {

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
        
    }

    override func willResignActive() {
        super.willResignActive()
        
    }
    
    
}

extension LoginPageInteractor: LoginPagePresentableListener {
    func previous() {
        print("2")
        self.listener?.previous()
    }
    
    func goToMainView() {
        self.listener?.goToMainView()
    }
}
