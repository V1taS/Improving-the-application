//
//  UniqueCellIdentifier.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 27.06.2021.
//

import UIKit

protocol UniqueCellIdentifier {
    static var reuseIdentifier: String { get }
}

extension UniqueCellIdentifier where Self: UITableViewHeaderFooterView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UniqueCellIdentifier where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UITableViewCell: UniqueCellIdentifier {}
extension UITableViewHeaderFooterView: UniqueCellIdentifier {}
