//
//  ServiceDns.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 10/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import Foundation

protocol ServiceDns {
    
    var dns: String { get }
    
}

extension ServiceDns where Self: RawRepresentable, Self.RawValue == String {
    
    var dns: String {
        return rawValue
    }
    
}
