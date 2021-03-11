//
//  Network.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    // MARK: Properties
    static let shared = Network()
    
    // MARK: Enums
    enum EndPoint: String {
        case beers
    }
    
    enum URLEndpoints: String {
        case api = "https://api.punkapi.com/v2/"
    }
    
    enum ParameterKey: String {
        case page
    }
    
    // MARK: Public Methods
    func fetchBeers(page: Int, completion: @escaping CompletionBlock.FetchBeers) {
        
        let url = URL(string: URLEndpoints.api.rawValue + EndPoint.beers.rawValue)!
        
        let parameters: Parameters = [
            ParameterKey.page.rawValue: page
        ]
        
        AF.request(url, method: .get, parameters: parameters).validate().responseJSON { response in
            let result = try? JSONSerialization.jsonObject(with: response.data ?? Data(), options: .allowFragments) as? [DataType.JSON]
            let beers = result?.toBeers()
            completion(beers, response.error)
        }
    }
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

// MARK: Extensions
extension Data {
    func toBeer() -> Beer? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Beer.self, from: self)
    }
}

extension Collection {
    
    func noDuplicates() -> [Beer]? {
        let beers = (self as? [Beer] ?? [])
        var result = [Beer]()
        for beer in beers {
            let hasDuplicates = result.filter({ $0.id == beer.id }).count > Int()
            if !hasDuplicates {
                result.append(beer)
            }
        }
        
        return result
        
    }
    
    func toBeer() -> Beer? {
        guard let beer = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted).toBeer() else { return nil }
        return beer
    }
    
    func toBeers() -> [Beer]? {
        var result = [Beer]()
        for item in self {
            guard let beer = try? JSONSerialization.data(withJSONObject: item, options: .prettyPrinted).toBeer() else { continue }
            result.append(beer)
        }
        
        return result
        
    }
}
