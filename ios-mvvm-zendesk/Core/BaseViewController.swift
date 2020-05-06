//
//  BaseViewController.swift
//  ios-mvvm-zendesk
//
//  Created by Zoárd Geöcze on 05/05/20.
//  Copyright © 2020 Zoárd Geöcze. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func showAlert(title: String, message: String, styleType: UIAlertAction.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: styleType, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
