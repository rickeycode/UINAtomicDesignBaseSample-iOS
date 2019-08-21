//
//  ATMHorizontalStackView.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/30.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public final class ATMHorizontalStackView: UIView, AtomCompatible {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect, ownMargin: MarginAsset) {
        self.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return }
        apply(margin: ownMargin, targetView: superview)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(view: UIView, margin: MarginAsset) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.apply(margin: margin, targetView: self)
        addSubview(view)
    }
}
