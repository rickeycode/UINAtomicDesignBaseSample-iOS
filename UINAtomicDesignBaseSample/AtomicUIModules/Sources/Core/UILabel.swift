//
//  UILabel.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/29.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import Foundation

public extension Atom where Base: UILabel {
    
    public func apply(color: UIColor) {
        base.textColor = color
    }
    
    public func apply(backgroundColor: UIColor) {
        base.backgroundColor = backgroundColor
    }
    
    public func apply(font: UIFont) {
        base.font = font
    }
    
    public func apply(text: String) {
        base.text = text
    }
    
    public func apply(lineSpacing: CGFloat) {
        let attributed: NSMutableAttributedString
        if let attributedText = base.attributedText {
            attributed = NSMutableAttributedString(attributedString: attributedText)
        } else {
            attributed = NSMutableAttributedString(string: base.text ?? "")
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        attributed.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: NSRange(location: 0, length: attributed.length))
        base.attributedText = attributed
    }
    
    public func apply(kern: CGFloat) {
        let stringAttributes: [NSAttributedString.Key : Any] = [
            .kern : kern
        ]
        let attributed: NSMutableAttributedString
        if let attributedText = base.attributedText {
            attributed = NSMutableAttributedString(attributedString: attributedText)
        } else {
            attributed = NSMutableAttributedString(string: base.text ?? "")
        }
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.addAttributes(stringAttributes, range: NSRange(location: 0, length: attributed.length))
        base.attributedText = mutableAttributedString
    }
}
