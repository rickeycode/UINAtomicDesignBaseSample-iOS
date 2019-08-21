//
//  ATMContentSeparator.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public enum ATMContentSeparatorType: ATMProductSeparatorEditableParams {
    case basicListBottom
    case custom(color: UIColor, weight: CGFloat)
    
    public var color: UIColor {
        switch self {
        case .basicListBottom:
            return ColorAsset.black100
        case .custom(let color, _):
            return color
        }
    }
    
    public var weight: CGFloat {
        switch self {
        case .basicListBottom:
            return LineSizeAsset.M
        case .custom(_, let weight):
            return weight
        }
    }
}

public final class ATMContentSeparator: ATMProductSeparator {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(type: ATMContentSeparatorType) {
        atom.apply(params: type)
    }
}
