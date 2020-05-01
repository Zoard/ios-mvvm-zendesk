//
//  TicketsListViewModel.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 01/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import ReactiveSwift

class TicketsListViewModel {
    
    let add = MutableProperty<Int>(0)
    
    func setAdd() {
        add.value += 1
    }
    
    func setSub() {
        add.value -= 1
    }
    
}
