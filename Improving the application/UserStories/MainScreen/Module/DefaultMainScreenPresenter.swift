//
//  DefaultMainScreenPresenter.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import Foundation

final class DefaultMainScreenPresenter {
    
    weak var view: MainScreenView?
    
    init(view: MainScreenView) {
        self.view = view
    }
}

extension DefaultMainScreenPresenter: MainScreenPresenter {
    func handle() {
        view?.updateData()
    }
}
