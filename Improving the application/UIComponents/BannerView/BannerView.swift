//
//  BannerView.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//  
//

import UIKit

public final class BannerView: UIView {
    
    // MARK: - Public variables
    public var design: BannerDesign = DefaultDesign() {
        didSet {
            apply(design)
        }
    }
    
    public var logo: UIImage? {
        didSet {
            logoImageView.image = logo
        }
    }
    
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
    
    public var tapArrowButton: (() -> Void)?
    
    // MARK: - Private variables
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let arrowNextButton = UIButton(type: .custom)
    private let spacer = UIView()
    
    private let horizontalStack = UIStackView()
    private let verticalStack = UIStackView()
    
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
    
    // MARK: - Private funcs
    private func apply(_ design: BannerDesign) {
    }
    
    private func configureLayout() {
        [titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            verticalStack.addArrangedSubview($0)
        }
        
        [logoImageView, verticalStack, spacer, arrowNextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            horizontalStack.addArrangedSubview($0)
        }
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalStack)
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            logoImageView.widthAnchor.constraint(equalToConstant: 60),
            
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        arrowNextButton.addTarget(self, action: #selector(tapArrow), for: .touchUpInside)
    }
    
    private func applyDefaultBehavior() {
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .black
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .gray
        
        verticalStack.axis = .vertical
        
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 16
        
        arrowNextButton.setImage(.arrowNext, for: .normal)
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.layer.cornerRadius = 30

        logoImageView.layer.borderWidth = 1
        logoImageView.layer.borderColor = UIColor.blue.cgColor
        logoImageView.clipsToBounds = true
        
        apply(design)
    }
    
    @objc
    private func tapArrow() {
        tapArrowButton?()
    }
}

private enum Constants {
}
