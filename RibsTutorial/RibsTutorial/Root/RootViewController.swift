//
//  RootViewController.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/22.
//

import RIBs
import RxSwift
import UIKit


protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
    }
}
