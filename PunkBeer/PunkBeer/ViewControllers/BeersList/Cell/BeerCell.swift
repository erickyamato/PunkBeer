//
//  BeerCell.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell, NibReusable {

    private enum Constants {
        static let kAlcoholicStrength = "Alcoholic strength:"
    }
    
    //MARK: Outlets
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var alcoholicStrengthLabel: UILabel!
    
    var beer: Beer? {
        didSet {
            guard let beer = beer else { return }
            
            beerImageView.af.setImage(withURL: URL(string: beer.imageURL)!)
            beerNameLabel.text = beer.name
            alcoholicStrengthLabel.text = "\(Constants.kAlcoholicStrength) \(beer.alcoholicStrength)"
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func applyStyle() {
        beerImageView.layer.cornerRadius = beerImageView.frame.height/2
    }
    
}
