//
//  MainScreenVC.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import UIKit

final class MainScreenVC: UIViewController {
    
    // MARK: - Internal variables
    var interactor: MainScreenInteractor?
    
    // MARK: - Private variables
    private let bigButtonView = BigButtonView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureActionTapButton()
        applyDefaultBehavior()
    }
    
    // MARK: - Private funcs
    private func configureLayout() {
        bigButtonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bigButtonView)
        
        NSLayoutConstraint.activate([
            bigButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bigButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func applyDefaultBehavior() {
        view.backgroundColor = UIColor.MainScreen.background
        title = Constants.title
        
        bigButtonView.titleText = Constants.titleButton
        bigButtonView.descriptionText = Constants.valueButton
    }
    
    private func configureActionTapButton() {
        bigButtonView.actionTap = { [weak self] in
            guard let self = self else { return }
            self.interactor?.loadedData()
        }
    }
}

extension MainScreenVC: MainScreenView {
    func updateData() {
        alert(Constants.titleAlert, Constants.descriptionAlert)
    }
}

private enum Constants {
    static var title: String { "Главный экран" }
    static var titleButton: String { "Купить" }
    static var valueButton: String { "1 200,14 ₽" }
    
    static var titleAlert: String { "Все работает" }
    static var descriptionAlert: String { "Спасибо" }
}
