//
//  MarginAsset.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/25.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit

public struct MarginSize {
    
    static let none: CGFloat = 0
    static let ss: CGFloat = 6
    static let s: CGFloat = 8
    static let m: CGFloat = 12
    static let l: CGFloat = 16
}

public enum MarginStyle {
    case flat(size: CGFloat)
    case flat_felxibleBottom(size: CGFloat)
    case flat_felxibleHeight(marginSize: CGFloat, height: CGFloat)

    var marginSize: [CGFloat] {
        switch self {
        case .flat(let size):
            return [size, size, size, size]
        case .flat_felxibleBottom(let size):
            return [size, size, size, size]
        case .flat_felxibleHeight(let size, _):
            return [size, size, size, size]
        }
    }

    func constraints(view: UIView, ownerView: UIView?) {
        switch self {
        case .flat:
            flatConstraints(view: view, ownerView: ownerView)
        case .flat_felxibleBottom:
            flatFlexibleBottomConstraints(view: view, ownerView: ownerView)
        case .flat_felxibleHeight(_, let size):
            addFlatFlexibleHeightConstraints(size: size, view: view, ownerView: ownerView)
        }
    }
    
    private func flatConstraints(view: UIView, ownerView: UIView?) -> [NSLayoutConstraint] {
        guard let ownerView = ownerView else { return [] }
        let constraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: ownerView, attribute: .top, multiplier: 1.0, constant: self.marginSize[0]),
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: ownerView, attribute: .trailing, multiplier: 1.0, constant: self.marginSize[1]),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: ownerView, attribute: .bottom, multiplier: 1.0, constant: self.marginSize[2]),
            NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: ownerView, attribute: .leading, multiplier: 1.0, constant: self.marginSize[3])
        ]
        return constraints
    }
    
    private func flatFlexibleBottomConstraints(view: UIView, ownerView: UIView?) -> [NSLayoutConstraint] {
        guard let ownerView = ownerView else { return [] }
        let constraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: ownerView, attribute: .top, multiplier: 1.0, constant: self.marginSize[0]),
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: ownerView, attribute: .trailing, multiplier: 1.0, constant: self.marginSize[1]),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: ownerView, attribute: .bottom, multiplier: 1.0, constant: self.marginSize[2]),
            NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: ownerView, attribute: .leading, multiplier: 1.0, constant: self.marginSize[3])
        ]
        return constraints
    }
    
    private func addFlatFlexibleHeightConstraints(size: CGFloat, view: UIView, ownerView: UIView?) {
        guard let ownerView = ownerView else { return }
        
        ownerView.removeConstraints(ownerView.constraints)
        view.removeConstraints(view.constraints)
        
        let constraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: ownerView, attribute: .top, multiplier: 1.0, constant: self.marginSize[0]),
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: ownerView, attribute: .trailing, multiplier: 1.0, constant: -self.marginSize[1]),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: ownerView, attribute: .bottom, multiplier: 1.0, constant: -self.marginSize[2]),
            NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: ownerView, attribute: .leading, multiplier: 1.0, constant: self.marginSize[3])
        ]
        
        NSLayoutConstraint.activate(constraints)
        ownerView.addConstraints(constraints)
        
        let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .height, multiplier: 1.0, constant: size)
        constraint.isActive = true
        view.addConstraint(constraint)
    }
}

public enum MarginAsset {
    case flat
    case flat_flexibleBottom
    case flat_flexibleHeight(height: CGFloat)
    case ss_flat
    case s_flat
    case m_flat
    case m_flat_flexibleHeight(height: CGFloat)
    case l_flat

    var style: MarginStyle {
        switch self {
        case .flat:
            return MarginStyle.flat(size: MarginSize.none)
        case .flat_flexibleBottom:
            return MarginStyle.flat_felxibleBottom(size: MarginSize.none)
        case .flat_flexibleHeight(let height):
            return MarginStyle.flat_felxibleHeight(marginSize: MarginSize.none, height: height)
        case .ss_flat:
            return MarginStyle.flat(size: MarginSize.ss)
        case .s_flat:
            return MarginStyle.flat(size: MarginSize.s)
        case .m_flat:
            return MarginStyle.flat(size: MarginSize.m)
        case .m_flat_flexibleHeight(let height):
            return MarginStyle.flat_felxibleHeight(marginSize: MarginSize.m, height: height)
        case .l_flat:
            return MarginStyle.flat(size: MarginSize.l)
        }
    }
}

public extension UIView {
    
    public func apply(margin: MarginAsset, targetView: UIView) {
        targetView.translatesAutoresizingMaskIntoConstraints = false
        margin.style.constraints(view: targetView, ownerView: self)
    }
}
