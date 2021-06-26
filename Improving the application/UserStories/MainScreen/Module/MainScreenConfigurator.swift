//
//  MainScreenConfigurator.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import UIKit

enum MainScreenConfigurator {

    static func createModule() -> UIViewController {
        let vc = MainScreenVC()
        let presenter = DefaultMainScreenPresenter(view: vc)
        let interactor = DefaultMainScreenInteractor(presenter)
        vc.interactor = interactor
        return vc
    }
}
