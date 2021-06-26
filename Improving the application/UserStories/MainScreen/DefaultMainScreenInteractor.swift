//
//  DefaultMainScreenInteractor.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import Foundation

final class DefaultMainScreenInteractor {

    let presenter: MainScreenPresenter

    init(_ presenter: MainScreenPresenter) {
        self.presenter = presenter
    }
}

extension DefaultMainScreenInteractor: MainScreenInteractor {
    func loadedView() {
    }
}
