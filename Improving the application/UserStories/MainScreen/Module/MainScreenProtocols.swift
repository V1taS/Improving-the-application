//
//  MainScreenProtocols.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import Foundation

protocol MainScreenInteractor {
    func loadedData()
}

protocol MainScreenPresenter {
    func handle()
}

protocol MainScreenView: AnyObject {
    func updateData()
}
