//
//  UIView.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public extension Atom where Base: UIView {
    
    public func apply(backgroundColor: UIColor) {
        base.backgroundColor = backgroundColor
    }
}
