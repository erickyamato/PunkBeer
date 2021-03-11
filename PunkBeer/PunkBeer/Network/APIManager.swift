//
//  APIManager.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 10/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import Foundation

private enum Constants {
    static let contentType     = "Content-Type"
    static let applicationJson = "application/json"
    static let timeoutInterval = 60.0
    
}

enum HttpMethod: String {
    case post = "POST"
    case get  = "GET"
}

class APIManager: NSObject {
    
    static let sharedInstance: APIManager = APIManager()
    
    private override init() { }
    
    public func requestApi(httpMethod: String = HttpMethod.get.rawValue,
                           apiUrl: String,
                           params: String?,
                           handler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        
        if let url = URL.with(string: apiUrl, param: params) {
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let HTTPHeaderField_ContentType  = Constants.contentType
            let ContentType_ApplicationJson  = Constants.applicationJson
            urlRequest.timeoutInterval = Constants.timeoutInterval
            urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
            urlRequest.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
            
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                handler(data, response, error)
            }
            dataTask.resume()
        }
    }
    
}

extension URL {
    
    static func with(string: String, param: String? = nil) -> URL? {
        var url = "\(APIDns.baseUrl.dns)\(string)"
        if let param = param {
            url += "&\(param)"
        }
        return URL(string: url)
    }
    
}
