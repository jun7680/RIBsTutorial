//
//  LoginPageViewController.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import RIBs
import RxSwift
import UIKit

protocol LoginPagePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoginPageViewController: UIViewController, LoginPagePresentable, LoginPageViewControllable {

    weak var listener: LoginPagePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
