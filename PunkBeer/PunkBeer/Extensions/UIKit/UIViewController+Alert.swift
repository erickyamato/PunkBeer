//
//  UIViewController+Alert.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

private enum Constants {
    static let warning = "Warning"
    static let ok      = "Ok"
}

extension UIViewController {
    
    func presentAlert(title: String? = nil, message: String, actionTitle: String? = nil, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title ?? Constants.warning, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle ?? Constants.ok, style: .default, handler: actionHandler))
        present(alertController, animated: true, completion: nil)
        
    }
    
}
