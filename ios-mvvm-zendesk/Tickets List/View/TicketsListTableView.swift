//
//  TicketsListTableView.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import UIKit

extension TicketsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tickets.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TicketsListConstants.viewCellNibName, for: indexPath) as! TicketsListViewCell
        
        cell.ticketTitleLabel.text = viewModel.tickets.value[indexPath.row].subject
        
        return cell
    }
    
}
