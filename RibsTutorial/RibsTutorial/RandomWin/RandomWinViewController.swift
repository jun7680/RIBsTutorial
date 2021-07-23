//
//  RandomWinViewController.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RIBs
import RxSwift
import UIKit

protocol RandomWinPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RandomWinViewController: UIViewController, RandomWinPresentable, RandomWinViewControllable {

    weak var listener: RandomWinPresentableListener?
}
