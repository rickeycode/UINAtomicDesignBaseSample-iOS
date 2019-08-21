//
//  MLCContentTitle.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public class MLCContentTitle: UIView, MoleculeCompatible {

    public func configure(title: String) {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        
        let stackView = ATMProductStackView(frame: frame)
        addSubview(stackView)
        stackView.atom.apply(axis: .vertical)
        stackView.atom.apply(distribution: .fill)
        apply(margin: .flat_flexibleHeight(height: 2), targetView: stackView)

        let title = ATMTitleLabel(frame: .zero, text: title)
        let wrapperView = ATMMarginWrapper(frame: .zero)
        wrapperView.configure(view: title, margin: .m_flat_flexibleHeight(height: 2))

        let separator = ATMContentSeparator(frame: .zero)
        separator.configure(type: .basicListBottom)

        stackView.addArrangedSubview(wrapperView)
        stackView.addArrangedSubview(separator)
    }
}
