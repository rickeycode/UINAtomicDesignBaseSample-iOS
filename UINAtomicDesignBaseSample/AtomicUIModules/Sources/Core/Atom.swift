//
//  Atom.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/24.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit

public struct Atom<Base> {
    var base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol AtomCompatible {
    associatedtype CompatibleType
    
    var atom: Atom<CompatibleType> { get }
}

public extension AtomCompatible {
    public var atom: Atom<Self> {
        return Atom(self)
    }
}
