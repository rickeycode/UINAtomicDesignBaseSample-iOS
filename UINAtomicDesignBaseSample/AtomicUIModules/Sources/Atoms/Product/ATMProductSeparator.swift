//
//  ATMProductSeparator.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public protocol ATMProductSeparatorEditableParams {
    var color: UIColor { get }
    var weight: CGFloat { get }
}

public extension ATMProductSeparatorEditableParams {
    var color: UIColor {
        return ColorAsset.black100
    }
    var weight: CGFloat {
        return LineSizeAsset.S
    }
}

public struct ATMProductSeparatorDesign: ATMProductSeparatorEditableParams {}

public class ATMProductSeparator: UIView, AtomCompatible {}

public extension Atom where Base: UIView {
    
    func apply(params: ATMProductSeparatorEditableParams) {
        base.heightAnchor.constraint(equalToConstant: params.weight).isActive = true
        apply(backgroundColor: params.color)
    }
}
