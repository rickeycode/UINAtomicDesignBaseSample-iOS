//
//  ViewController.swift
//  UINAtomicDesignBaseSample
//
//  Created by 田中 佑 on 2019/01/24.
//  Copyright © 2019年 yu tanaka. All rights reserved.
//

import UIKit
import AtomicUIModules

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        view.addSubview(tableView)
        return tableView
    }()
    
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setup() {
        Home.SectionType.cellIdentifers.forEach {
            tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.sections[indexPath.section].type.identifer, for: indexPath)
        guard let modeleredCell = cell as? CellModelProtocol else { return cell }
        modeleredCell.configure(vm: viewModel.sections[indexPath.section].cellModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
