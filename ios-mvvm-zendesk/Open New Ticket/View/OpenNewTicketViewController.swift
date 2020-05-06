//
//  OpenNewTicket.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift

class OpenNewTicketViewController: BaseViewController {
    
    @IBOutlet weak var ticketSubjectLabel: UITextField!
    @IBOutlet weak var ticketCommentLabel: UITextField!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    let viewModel: OpenNewTicketViewModel
    
    init(viewModel: OpenNewTicketViewModel) {
        self.viewModel = viewModel
        super.init(nibName: OpenNewTicketConstants.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        bindViewModel()
    }
    
    private func setNavigationBar() {
        self.navigationItem.title = OpenNewTicketConstants.navBarTitle
    }
    
    private func bindViewModel() {
        viewModel.openNewTicketResult.output.observe(on: UIScheduler()).observeResult(requestAlert)
        viewModel.loading.producer.observe(on: UIScheduler()).startWithValues(loadingRequest)
    }
    
    private func requestAlert(action: Result<Ticket,Error>) {
        switch action {
        case .success(let ticket):
            showAlert(
                title: "Ticket #\(ticket.id) opened with success!",
                message: AlertConstants.openNewTicketSuccessMessage,
                styleType: .default,
                backToTicketsList)
            break
        case .failure(let error):
            showAlert(
                title: AlertConstants.openNewTicketFailedTitle,
                message: error.localizedDescription,
                styleType: .cancel)
            break
        }
    }
    
    private func loadingRequest(_ loading: Bool) {
        if loading {
            self.view.alpha = 0.5
            loadingIndicatorView.isHidden = false
            loadingIndicatorView.startAnimating()
        } else {
            loadingIndicatorView.stopAnimating()
            loadingIndicatorView.isHidden = true
            self.view.alpha = 1
        }
    }
    
    @IBAction func openNewTicket(_ sender: UIButton) {
        guard let subject = ticketSubjectLabel.text, !subject.isEmpty else {
            showAlert(
                title: AlertConstants.obrigatoryFieldTitle,
                message: AlertConstants.obrigatorySubjectFieldMessage,
                styleType: .cancel
            )
            return
        }
                
        guard let comment = ticketCommentLabel.text, !comment.isEmpty else {
            showAlert(
                title: AlertConstants.obrigatoryFieldTitle,
                message: AlertConstants.obrigatoryCommentFieldMessage,
                styleType: .cancel
            )
            return
        }
        
        viewModel.openNewTicket(subject: subject, comment: comment)
    }
    
    
    func backToTicketsList(_ action: UIAlertAction) {
        self.navigationController?.popViewController(animated: true)
    }
}
