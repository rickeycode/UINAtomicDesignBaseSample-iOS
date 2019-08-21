//
//  MLCContentTitleCell.swift
//  UINAtomicDesignBaseSample
//
//  Created by 田中 佑 on 2019/01/30.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit
import AtomicUIModules

class MLCContentTitleCell: UITableViewCell, CellModelProtocol {
    
    @IBOutlet weak var mlcContentTitle: MLCContentTitle!
    
    func configure(vm: ViewModelProtocol) {
        guard let vm = vm as? Home.TopHeader else { return }
        mlcContentTitle.configure(title: vm.title)
        
//        layoutIfNeeded()
    }
}
