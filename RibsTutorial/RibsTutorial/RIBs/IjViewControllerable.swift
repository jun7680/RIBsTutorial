//
//  IjViewControllerable.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import Foundation
import UIKit
import RIBs

protocol IjViewControllerable: ViewControllable {
    func present(viewController: ViewControllable, presentStyle: UIModalPresentationStyle)
    func pushVC(viewController: ViewControllable, animated: Bool)
    func popVC(viewController: ViewControllable, animated: Bool)
    func presentNavi(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable, animated: Bool, completion: (() -> Void)?)
}

extension IjViewControllerable {
    func present(viewController: ViewControllable, presentStyle: UIModalPresentationStyle = .fullScreen) {
        let presentVC = viewController.uiviewController
        presentVC.modalPresentationStyle = presentStyle
        presentVC.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            self.uiviewController.present(presentVC, animated: true, completion: nil)
        }
    }
    
    func pushVC(viewController: ViewControllable, animated: Bool) {
        let presentVC = viewController.uiviewController
        presentVC.modalPresentationStyle = .fullScreen
        presentVC.hidesBottomBarWhenPushed = true
        print("push")
        DispatchQueue.main.async {
            self.uiviewController.navigationController?.pushViewController(presentVC, animated: animated)
        }
    }
    
    func popVC(viewController: ViewControllable, animated: Bool) {
        DispatchQueue.main.async {
            let lastVC = self.uiviewController.navigationController?.viewControllers.last
            if lastVC == viewController.uiviewController {
                self.uiviewController.navigationController?.popViewController(animated: animated)
            }
        }
    }
    
    func presentNavi(viewController: ViewControllable) {
        let presentVC = UINavigationController(rootViewController: viewController.uiviewController)
        presentVC.modalPresentationStyle = .fullScreen
        presentVC.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            self.uiviewController.present(presentVC, animated: true, completion: nil)
        }
    }
    
    func dismiss(viewController: ViewControllable, animated: Bool = true, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            let presentVC = self.uiviewController.presentedViewController
            if presentVC == viewController.uiviewController {
                self.uiviewController.dismiss(animated: animated, completion: completion)
                return
            } else if presentVC?.childViewControllerForPointerLock == viewController.uiviewController {
                self.uiviewController.dismiss(animated: animated, completion: completion)
            } else {
                completion?()
            }
        }
    }
    
}
