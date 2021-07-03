//
//  UIAlertController+PresentAlert.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 03.07.2021.
//

import UIKit

extension UIViewController {
    
    func alert(_ title: String, _ message: String) {
        self.present(UIAlertController.alertWithOneButton(title: title, message: message, action: {
            self.dismiss(animated: true, completion: nil)
        }), animated: true, completion: nil)
    }
}
