//
//  ViewModel.swift
//  UINAtomicDesignBaseSample
//
//  Created by 田中 佑 on 2019/01/30.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit
import AtomicUIModules

class HomeViewModel {
    
    var sections: [HomeSection] = []
    
    init() {
        setup()
    }
    
    func setup() {
        sections.append(HomeSection(cellModels: [Home.TopHeader()], type: .topHeader))
        sections.append(HomeSection(cellModels: Home.TopicsContent.contents, type: .topContent))
        sections.append(HomeSection(cellModels: Home.ListContent.contents, type: .listContent))
        sections.append(HomeSection(cellModels: [Home.Recommend()], type: .recommend))
        sections.append(HomeSection(cellModels: [Home.TopicsHeader()], type: .topicsHeader))
        sections.append(HomeSection(cellModels: Home.TopicsContent.contents, type: .topicsContent))
    }
}
