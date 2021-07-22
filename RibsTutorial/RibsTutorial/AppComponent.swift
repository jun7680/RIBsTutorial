//
//  AppComponent.swift
//  RibsTutorial
//
//  Created by injun on 2021/07/22.
//
import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
