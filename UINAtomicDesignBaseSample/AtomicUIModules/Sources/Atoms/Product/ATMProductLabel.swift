//
//  ATMProductLabel.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/24.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit

public protocol ATMProductLabelEditableParams {
    var color: UIColor { get }
    var font: UIFont { get }
}

public extension ATMProductLabelEditableParams {
    var color: UIColor {
        return ColorAsset.black100
    }
    var font: UIFont {
        return FontAsset.system.withSize(LabelSizeAsset.M)
    }
}

public struct ATMProductLabelDesign: ATMProductLabelEditableParams {}

public class ATMProductLabel: UILabel, AtomCompatible {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let params = ATMProductLabelDesign()
        atom.apply(color: params.color)
        atom.apply(font: params.font)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension Atom where Base: UILabel {
    
    func apply(params: ATMProductLabelEditableParams) {
        base.textColor = params.color
        base.font = params.font
    }
}
