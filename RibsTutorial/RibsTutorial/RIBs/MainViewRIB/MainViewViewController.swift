//
//  MainViewViewController.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/04.
//

import RIBs
import RxSwift
import UIKit

protocol MainViewPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewViewController: UIViewController, MainViewPresentable, MainViewViewControllable {

    weak var listener: MainViewPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
