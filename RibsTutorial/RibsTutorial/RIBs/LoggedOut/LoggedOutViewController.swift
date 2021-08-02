//
//  LoggedOutViewController.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/30.
//

import UIKit
import RIBs
import RxSwift
import RxCocoa
import SnapKit

protocol LoggedOutPresentableListener: AnyObject {
    func nextPage()
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    private let titleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textAlignment = .left
        $0.text = "testtest"
    }
    private let nextButton = UIButton().then {
        $0.setTitle("next", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        let cornerRadius: CGFloat = 4
        nextButton.layer.cornerRadius = cornerRadius
        nextButton.clipsToBounds = true
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        let padding: CGFloat = 24
        let logoPadding: CGFloat = 12
        let logoTopPadding: CGFloat = 180
        let buttonBottomPadding: CGFloat = 113
        let buttonHeight: CGFloat = 56

        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(padding)
        }
        nextButton.snp.makeConstraints {
            $0.height.equalTo(buttonHeight)
            $0.leading.trailing.equalToSuperview().inset(padding)
            $0.bottom.equalToSuperview().inset(buttonBottomPadding)
        }

    }
    
    private func bindUI() {
        nextButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.listener?.nextPage()
            }
    }
    
}
