//
//  Molecule.swift
//  AtomicUIModules
//
//  Created by 田中 佑 on 2019/01/24.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit

public struct Molecule<Base> {
    public var base: Base

    init(_ base: Base) {
        self.base = base
    }
}

public protocol MoleculeCompatible {
    associatedtype CompatibleType
    
    var molecule: Molecule<CompatibleType> { get }
}

public extension MoleculeCompatible {
    public var molecule: Molecule<Self> {
        return Molecule(self)
    }
}
