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
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let refreshControl = UIRefreshControl()
    private var viewModels = [MainScreenBannerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    // MARK: - Private funcs
    private func configureLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func applyDefaultBehavior() {
        
        view.backgroundColor = .blue
        title = "Главный экран"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainScreenBannerCell.self, forCellReuseIdentifier: MainScreenBannerCell.reuseIdentifier)

        loadContent()
        configureRefreshControl()
    }
    
    private func loadContent() {
        refreshControl.beginRefreshing()
        interactor?.loadedBaners()
    }
    
    private func configureRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
    }
    
    @objc
    private func pullToRefreshAction() {
        loadContent()
    }
}

extension MainScreenVC: MainScreenView {
    func updateData(_ viewModel: [MainScreenBannerModel]) {
        self.viewModels = viewModel
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension MainScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenBannerCell.reuseIdentifier,
                                                       for: indexPath) as? MainScreenBannerCell else { return UITableViewCell() }
        let banerViewModel = viewModels[indexPath.row]
        cell.containedView.titleText = banerViewModel.title
        cell.containedView.descriptionText = banerViewModel.description
        cell.containedView.logo = banerViewModel.logo
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        return cell
    }
}

private enum Constants {
}
