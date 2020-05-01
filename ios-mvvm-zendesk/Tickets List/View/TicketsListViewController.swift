//
//  ViewController.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 28/04/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import UIKit
import ReactiveSwift

class TicketsListViewController: UIViewController {
    
    private let viewModel: TicketsListViewModel
        
    @IBOutlet weak var ticketsListTableView: UITableView!
    
    init(viewModel: TicketsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TicketsListView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        bindViewModel()
    }
    
    private func setTableView() {
        let nib = UINib(nibName: "TicketsListViewCell", bundle: nil)
        ticketsListTableView.register(nib, forCellReuseIdentifier: "TicketsListViewCell")
        ticketsListTableView.delegate = self
        ticketsListTableView.dataSource = self
    }
    
    private func bindViewModel() {
//        viewModel.add.producer.observe(on: UIScheduler()).startWithValues(setAddLabel(value:))
    }
    
}

