//
//  LoginPageViewController.swift
//  RibsTutorial
//
//  Created by injun on 2021/08/02.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol LoginPagePresentableListener: AnyObject {
    func previous()
    func goToMainView()
}

final class LoginPageViewController: UIViewController, LoginPagePresentable, LoginPageViewControllable {

    weak var listener: LoginPagePresentableListener?
    private let disposeBag = DisposeBag()
    private let idTextField = UITextField().then {
        $0.keyboardType = .emailAddress
        $0.borderStyle = .line
    }
    private let pwTextField = UITextField().then {
        $0.isSecureTextEntry = true        
        $0.borderStyle = .line
    }
    
    private let nextButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
    }
    
    private let previousButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("뒤로가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        clearNavgationBarBackground()
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        
        setConstraints()
        bindUI() 
    }
    
    private func setConstraints() {
        let padding: CGFloat = 12
        
        let horizontalPadding = 20
        let eidtViewTopPadding = 100
        let buttonTopPadding = 43
        
        let editViewHeight = 78
        let buttonHeight = 56
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(eidtViewTopPadding)
            $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
            $0.height.equalTo(buttonHeight)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(horizontalPadding)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(buttonHeight)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(buttonTopPadding)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(buttonHeight)
        }
        
        previousButton.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(buttonTopPadding)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(buttonHeight)
        }
    }
    
    private func clearNavgationBarBackground() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationItem.hidesBackButton = true
    }
    
    private func bindUI() {
        previousButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                print("1")
                owner.listener?.previous()
            }.disposed(by: disposeBag)
        
        nextButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                print("goto main")
                owner.listener?.goToMainView()
            }.disposed(by: disposeBag)
    }
}
