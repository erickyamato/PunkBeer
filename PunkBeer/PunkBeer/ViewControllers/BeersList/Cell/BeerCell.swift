//
//  BeerCell.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell, NibReusable {

    //MARK: Outlets
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var alcoholicStrengthLabel: UILabel!
    
    
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
