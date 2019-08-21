//
//  ATMTextLabel.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public enum ATMTextLabelType: ATMProductLabelEditableParams {
    case subTitle
    case content
    case custom(color: UIColor, font: UIFont)
    
    public var color: UIColor {
        switch self {
        case .subTitle:
            return ColorAsset.gray200
        case .content:
            return ColorAsset.gray100
        case .custom(let color, _):
            return color
        }
    }
    
    public var font: UIFont {
        switch self {
        case .subTitle:
            return FontAsset.italicSystem.withSize(LabelSizeAsset.M)
        case .content:
            return FontAsset.system.withSize(LabelSizeAsset.S)
        case .custom(_, let font):
            return font
        }
    }
}

public final class ATMTextLabel: ATMProductLabel {
    
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
    
    public func configure(type: ATMTextLabelType, text: String) {
        self.atom.apply(params: type)
        self.atom.apply(text: text)
    }
}
