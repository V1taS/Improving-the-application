//
//  MainScreenBannerCell.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//

import UIKit

struct MainScreenBannerCellInsets: ContainerInsets {
    static var insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}

typealias MainScreenBannerCell = ContainerTableCell<BannerView, MainScreenBannerCellInsets>
