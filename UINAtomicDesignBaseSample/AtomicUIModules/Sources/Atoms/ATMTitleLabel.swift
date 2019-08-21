//
//  ATMTitleLabel.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public enum ATMTitleLabelType: ATMProductLabelEditableParams {
    case h1
    case h2
    case h3
    case h4
    case h5
    case custom(color: UIColor, font: UIFont)
    
    public var color: UIColor {
        switch self {
        case .h1:
            return ColorAsset.black100
        case .h2:
            return ColorAsset.black100
        case .h3:
            return ColorAsset.black100
        case .h4:
            return ColorAsset.black100
        case .h5:
            return ColorAsset.black100
        case .custom(let color, _):
            return color
        }
    }
    
    public var font: UIFont {
        switch self {
        case .h1:
            return FontAsset.boldSystem.withSize(LabelSizeAsset.XXL)
        case .h2:
            return FontAsset.boldSystem.withSize(LabelSizeAsset.XL)
        case .h3:
            return FontAsset.boldSystem.withSize(LabelSizeAsset.L)
        case .h4:
            return FontAsset.boldSystem.withSize(LabelSizeAsset.M)
        case .h5:
            return FontAsset.boldSystem.withSize(LabelSizeAsset.S)
        case .custom(_, let font):
            return font
        }
    }
}

public final class ATMTitleLabel: ATMProductLabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect, text: String) {
        self.init(frame: frame)
        self.atom.apply(text: text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(type: ATMTitleLabelType, text: String) {
        self.atom.apply(params: type)
        self.atom.apply(text: text)
    }
}
