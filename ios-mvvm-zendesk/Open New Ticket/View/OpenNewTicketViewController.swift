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
    
    let viewModel: OpenNewTicketViewModel
    
    init(viewModel: OpenNewTicketViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "OpenNewTicketView", bundle: nil)
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
        self.navigationItem.title = "Open A New Ticket"
    }
    
    private func bindViewModel() {
        viewModel.responseMessage.output.observe(on: UIScheduler()).observeResult(seila)
    }
    
    private func seila(action: Result<Ticket,Error>) {
        switch action {
        case .success(let ticket):
            showAlert(
                title: "Ticket #\(ticket.id) opened with success!",
                message: "Verify your ticket on your tickets list.",
                styleType: .default,
                backToTicketsList)
            break
        case .failure(let error):
            showAlert(
                title: "Ops! Something happened. Try again.",
                message: error.localizedDescription,
                styleType: .cancel)
            break
        }
    }
    
    @IBAction func openNewTicket(_ sender: UIButton) {
        guard let subject = ticketSubjectLabel.text, !subject.isEmpty else {
            showAlert(
                title: AlertMessages.obrigatoryFieldTitle.rawValue,
                message: AlertMessages.obrigatorySubjectFieldMessage.rawValue,
                styleType: .cancel
            )
            return
        }
                
        guard let comment = ticketCommentLabel.text, !comment.isEmpty else {
            showAlert(
                title: AlertMessages.obrigatoryFieldTitle.rawValue,
                message: AlertMessages.obrigatoryCommentFieldMessage.rawValue,
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
