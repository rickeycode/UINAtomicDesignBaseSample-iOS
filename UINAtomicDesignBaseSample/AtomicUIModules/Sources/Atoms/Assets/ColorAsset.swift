//
//  ColorAsset.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/25.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit

public struct ColorAsset {
    
    static let white = UIColor(hex: "FFFFFF")
    static let white100 = UIColor(hex: "DDDDDD")
    
    static let gray100 = UIColor(hex: "FEFEFE")
    static let gray200 = UIColor(hex: "666666")
    
    static let black100 = UIColor(hex: "4c4c4c")
    static let black200 = UIColor(hex: "333333")
    static let black300 = UIColor(hex: "000000")

    static let blue100 = UIColor(hex: "9ec0f7")
    static let blue200 = UIColor(hex: "6ca1f7")
    static let blue300 = UIColor(hex: "3d84f7")
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
