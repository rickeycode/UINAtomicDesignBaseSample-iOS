//
//  ATMProductStackView.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/30.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public protocol ATMProductStackViewEditableParams {
    var axis: NSLayoutConstraint.Axis { get }
    var alignment: UIStackView.Alignment { get }
    var distribution: UIStackView.Distribution { get }
    var spacing: CGFloat { get }
}

public extension ATMProductStackViewEditableParams {
    var axis: NSLayoutConstraint.Axis {
        return .horizontal
    }
    var alignment: UIStackView.Alignment {
        return .center
    }
    var distribution: UIStackView.Distribution {
        return .fill
    }
    var spacing: CGFloat {
        return 0
    }
}

public struct ATMProductStackViewDesign: ATMProductSeparatorEditableParams {}

public class ATMProductStackView: UIStackView, AtomCompatible {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(position: CGPoint) {
        let params = ATMProductStackViewDesign()
        self.init(frame: CGRect(x: position.x, y: position.y, width: ApplicationAsset.mainScreenWidth, height: params.weight))
        atom.apply(params: params)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension Atom where Base: UIStackView {
    
    func apply(params: ATMProductStackViewEditableParams) {
        base.axis = params.axis
        base.alignment = params.alignment
        base.distribution = params.distribution
        base.spacing = params.spacing
    }
}
