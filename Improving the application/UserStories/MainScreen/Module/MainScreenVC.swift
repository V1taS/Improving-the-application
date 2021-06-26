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
    private let tableview = UITableView(frame: .zero, style: .plain)
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    // MARK: - Private funcs
    private func configureLayout() {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func applyDefaultBehavior() {
        
        view.backgroundColor = .blue
        title = "Главный экран"
        loadContent()
    }
    
    private func loadContent() {
        interactor?.loadedView()
    }
}

extension MainScreenVC: MainScreenView {
}

private enum Constants {
}
