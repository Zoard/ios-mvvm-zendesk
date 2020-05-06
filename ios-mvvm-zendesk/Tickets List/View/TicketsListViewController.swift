//
//  ViewController.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 28/04/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import UIKit
import ReactiveSwift

class TicketsListViewController: BaseViewController {
    
    let viewModel: TicketsListViewModel
        
    @IBOutlet weak var ticketsListTableView: UITableView!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    init(viewModel: TicketsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: TicketsListConstants.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadTickets()
    }
    
    private func setNavigationBar() {
        self.navigationItem.title = TicketsListConstants.navBarTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addNewTicket(_:)))
    }
    
    @objc private func addNewTicket(_ sender: UIBarButtonItem) {
        let openNewTicketViewController = OpenNewTicketViewController(
            viewModel: OpenNewTicketViewModel(ticketService: TicketService()))
        self.navigationController?.pushViewController(openNewTicketViewController, animated: true)
    }
    
    private func setTableView() {
        let nib = UINib(nibName: TicketsListConstants.viewCellNibName, bundle: nil)
        ticketsListTableView.register(nib, forCellReuseIdentifier: TicketsListConstants.viewCellNibName)
        ticketsListTableView.delegate = self
        ticketsListTableView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.tickets.producer.observe(on: UIScheduler()).startWithValues(reloadTableView)
        viewModel.loading.producer.observe(on: UIScheduler()).startWithValues(loadingTableView)
    }
    
    private func reloadTableView(_ tickets:[Ticket]) {
        ticketsListTableView.reloadData()
    }
    
    private func loadingTableView(_ loading: Bool) {
        if loading {
            ticketsListTableView.isHidden = true
            loadingIndicatorView.isHidden = false
            loadingIndicatorView.startAnimating()
        } else {
            loadingIndicatorView.stopAnimating()
            loadingIndicatorView.isHidden = true
            ticketsListTableView.isHidden = false
        }
    }
    
}

