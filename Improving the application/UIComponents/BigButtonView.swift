//
//  BigButtonView.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 03.07.2021.
//  
//

import UIKit

public final class BigButtonView: UIView {
    
    // MARK: - Public variables
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    public var actionTap: (() -> Void)?
    
    public override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.defaultWidth, height: Constants.defaultHeight)
    }
    
    // MARK: - Private variables
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let stack = UIStackView()
    private var staticConstraints = [NSLayoutConstraint]()
    private var previousBounds: CGRect = .zero
    
    // MARK: - Public funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
        applyDefaultBehavior()
    }
    
    public override func updateConstraints() {
        if staticConstraints.isEmpty {
            staticConstraints = [
                stack.topAnchor.constraint(equalTo: topAnchor, constant: Constants.verticalAnchor),
                stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.horizontalAnchor),
                stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.verticalAnchor),
                stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.horizontalAnchor)
            ]
            NSLayoutConstraint.activate(staticConstraints)
        }
        super.updateConstraints()
    }
    
    public override func layoutSubviews() {
        if bounds != previousBounds {
            if let cornerRadiusLayer = layer as? CAShapeLayer {
                cornerRadiusLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: Constants.cornerRadius).cgPath
                cornerRadiusLayer.fillColor = UIColor.BigButton.background.cgColor
            }
        }
        super.layoutSubviews()
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        actionTap?()
    }
    
    // MARK: - Private funcs
    private func configureLayout() {
        [titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    }
    
    private func applyDefaultBehavior() {
        stack.axis = .vertical
        stack.spacing = Constants.stackSpacing
        stack.distribution = .fillEqually
        stack.alignment = .center
        
        titleLabel.textColor = UIColor.BigButton.title
        titleLabel.font = .t4Med
        titleLabel.backgroundColor = UIColor.BigButton.background
        
        descriptionLabel.textColor = UIColor.BigButton.description
        descriptionLabel.font = .t6Bold
        descriptionLabel.backgroundColor = UIColor.BigButton.background
    }
}

private enum Constants {
    static var defaultHeight: CGFloat { 58 }
    static var defaultWidth: CGFloat { 122 }
    
    static var stackSpacing: CGFloat { 2 }
    
    static var verticalAnchor: CGFloat { 6 }
    static var horizontalAnchor: CGFloat { 14 }
    
    static var cornerRadius: CGFloat { 8 }
}
