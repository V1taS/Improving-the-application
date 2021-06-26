//
//  MainScreenBannerModel.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 27.06.2021.
//

import UIKit

final class MainScreenBannerModel {
    let logo: UIImage
    let title: String
    let description: String
    
    init(logo: UIImage, title: String, description: String) {
        self.logo = logo
        self.title = title
        self.description = description
    }
}

extension MainScreenBannerModel {
    static func getBannerArray() -> [MainScreenBannerModel] {
        var bannerArray = [MainScreenBannerModel]()
        (1...1000).forEach {_ in
            bannerArray.append(
                MainScreenBannerModel(logo: .logo,
                                      title: "Автосирвисы и магазины",
                                      description: "Запчасти, гаджеты...")
            )
        }
        return bannerArray
    }
}
