//
//  Beer.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import Foundation

struct Beer: Codable {
  
  let id               : Int
  let name             : String
  let description      : String
  let imageURL         : String
  let alcoholicStrength: Double
  let tagline          : String
  let bitterness       : Double
  
  private enum CodingKeys: String, CodingKey {
    case id, name, description, tagline
    case imageURL          = "image_url"
    case alcoholicStrength = "abv"
    case bitterness        = "ibu"
  }
    
}
