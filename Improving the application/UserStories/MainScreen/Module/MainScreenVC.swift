//
//  MainScreenVC.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import UIKit

final class MainScreenVC: UIViewController {

    var interactor: MainScreenInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        interactor?.loadedView()
    }

    private func configureSubviews() {
        view.backgroundColor = .red
        title = "Главный экран"
    }
}

extension MainScreenVC: MainScreenView {
}

private enum Constants {
}
