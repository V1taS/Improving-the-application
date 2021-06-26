//
//  ContainerTableCell.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//

import UIKit

protocol ContainerInsets {
    static var insets: UIEdgeInsets { get }
}

class ContainerTableCell<T: UIView, P: ContainerInsets>: UITableViewCell {
    
    let containedView: T = T()
    var componentInsets: UIEdgeInsets = P.insets {
        didSet {
            componentLeadingConstraint?.constant = componentInsets.left
            componentTrailingConstraint?.constant = -componentInsets.right
            componentTopConstraint?.constant = componentInsets.top
            componentBottomConstraint?.constant = -componentInsets.bottom
        }
    }
    
    private var componentLeadingConstraint: NSLayoutConstraint!
    private var componentTrailingConstraint: NSLayoutConstraint!
    private var componentTopConstraint: NSLayoutConstraint!
    private var componentBottomConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        containedView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containedView)
        
        componentLeadingConstraint = containedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: P.insets.left)
        componentTrailingConstraint = containedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -P.insets.right)
        componentTopConstraint = containedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: P.insets.top)
        componentBottomConstraint = containedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -P.insets.bottom)
        
        [componentLeadingConstraint,
         componentTrailingConstraint,
         componentTopConstraint,
         componentBottomConstraint]
            .forEach { $0?.priority = UILayoutPriority.defaultHigh }
        
        NSLayoutConstraint.activate([
            componentLeadingConstraint,
            componentTrailingConstraint,
            componentTopConstraint,
            componentBottomConstraint
        ])
    }
}
