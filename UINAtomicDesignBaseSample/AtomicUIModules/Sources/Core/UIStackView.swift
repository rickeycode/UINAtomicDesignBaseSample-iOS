//
//  UIStackView.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/30.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public extension Atom where Base: UIStackView {
    
    public func apply(axis: NSLayoutConstraint.Axis) {
        base.axis = axis
    }
    
    public func apply(alignment: UIStackView.Alignment) {
        base.alignment = alignment
    }
    
    public func apply(distribution: UIStackView.Distribution) {
        base.distribution = distribution
    }
    
    public func apply(spacing: CGFloat) {
        base.spacing = spacing
    }
}
