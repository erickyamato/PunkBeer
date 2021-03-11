//
//  APIDns.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 10/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import Foundation

enum APIDns: String, ServiceDns {
    
    private enum Constants {
        static let apiDnsMapKey = "API_DNS"
    }
    
    case baseUrl = "BASE_URL"
    
    var dns: String {
        guard let dnsMap = Bundle.main.object(forInfoDictionaryKey: Constants.apiDnsMapKey) as? NSDictionary else {
            fatalError("Add a dictionary with key \(Constants.apiDnsMapKey) to set your DNS")
        }
        
        guard let url = dnsMap[self.rawValue] as? String,
              !url.isEmpty else {
            fatalError("You should specify a API DNS with name \(self.rawValue) in projects's build settings inside \"User defined\" section and add this variable at a Info.plist file with the key \(self.rawValue)}")
        }
        
        return url
    }
}
