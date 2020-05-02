//
//  OpenNewTicket.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import UIKit

class OpenNewTicketViewController: UIViewController {
    
    
    @IBOutlet weak var ticketSubjectLabel: UITextField!
    @IBOutlet weak var ticketCommentLabel: UITextField!
    
    init() {
        super.init(nibName: "OpenNewTicketViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        
    }
    
    @IBAction func backToTicketsList(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
