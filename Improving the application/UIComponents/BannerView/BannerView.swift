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

    // MARK: - Private variables

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
    }

    private func applyDefaultBehavior() {
        // Put
        apply(design)
    }
}

private enum Constants {
}
