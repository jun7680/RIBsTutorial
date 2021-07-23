//
//  ActionableItems.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/23.
//

import RxSwift
public protocol LoggedInActionableItem: AnyObject {
    func launchGame(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
