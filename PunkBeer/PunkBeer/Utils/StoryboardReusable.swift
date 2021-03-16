//
//  StoryboardReusable.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 16/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

struct StoryboardReusable {
    
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func beerListViewController() -> UINavigationController? {
      return mainStoryboard.instantiateViewController(withIdentifier: "BeersListViewController") as? UINavigationController
    }
    
    static func beersDetailsViewController() -> BeersDetailsViewController? {
      return mainStoryboard.instantiateViewController(withIdentifier: "BeersDetailsViewController") as? BeersDetailsViewController
    }
    
}
