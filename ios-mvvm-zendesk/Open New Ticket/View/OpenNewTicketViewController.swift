//
//  OpenNewTicket.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import UIKit

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
        
    }
    
    @IBAction func openNewTicket(_ sender: UIButton) {
        guard let subject = ticketSubjectLabel.text, !subject.isEmpty else {
            showAlert(
                title: AlertMessages.obrigatoryField.rawValue,
                message: AlertMessages.obrigatorySubjectField.rawValue,
                styleType: .cancel
            )
            return
        }
                
        guard let comment = ticketCommentLabel.text, !comment.isEmpty else {
            showAlert(
                title: AlertMessages.obrigatoryField.rawValue,
                message: AlertMessages.obrigatoryCommentField.rawValue,
                styleType: .cancel
            )
            return
        }
        
        viewModel.openNewTicket(subject: subject, comment: comment)
    }
    
    
    @IBAction func backToTicketsList(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
