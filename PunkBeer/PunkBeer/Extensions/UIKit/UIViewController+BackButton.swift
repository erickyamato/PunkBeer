//
//  UIViewController+BackButton.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func backButtonTitle(with title: String? = nil) {
        
        let backItem = UIBarButtonItem()
        backItem.title = title ?? String()
        navigationItem.backBarButtonItem = backItem
        
    }
    
}
