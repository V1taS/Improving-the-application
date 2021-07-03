//
//  UIAlertController+ShowSimpleMessage.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 03.07.2021.
//

import UIKit

extension UIAlertController {
    
    static func alertWithOneButton(title: String, message: String? = nil, action: (()-> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.defaultOkButtonText, style: .default, handler: { btn in
            action?()
        }))
        return alertController
    }
}

private enum Constants {
    static var defaultOkButtonText: String { "OK" }
}
