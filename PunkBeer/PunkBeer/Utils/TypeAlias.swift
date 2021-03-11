//
//  TypeAlias.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import Foundation

struct CompletionBlock {
  typealias FetchBeers = ([Beer]?, Error?) -> Void
  typealias Empty = () -> Void
}

struct DataType {
  typealias JSON = [AnyHashable: Any?]
}
