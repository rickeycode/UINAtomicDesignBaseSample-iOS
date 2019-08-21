//
//  ATMMarginWrapper.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public final class ATMMarginWrapper: UIView, AtomCompatible {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(view: UIView, margin: MarginAsset) {
        addSubview(view)
        apply(margin: margin, targetView: view)
    }
}
