//
//  BeersDetailsViewController.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 15/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

class BeersDetailsViewController: UIViewController {

    private enum Constants {
        static let kAlcoholicStrength          = "Alcoholic strength:"
        static let kBitterness                 = "Bitterness:"
        static let kDescription                = "Desciption"
        static let kThirteenFontSize: CGFloat  = 13
        static let kFourteenFontSize: CGFloat  = 14
        static let kSevenTeenFontSize: CGFloat = 17
    }
    
    var beer: Beer?
    
    //MARK: Outlets
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerAlcoholicStrengthLabel: UILabel!
    @IBOutlet weak var beerBitternessLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var beerDescriptionTextView: UITextView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyImage()
        applyLanguage()
        applyStyle()
    }
    
    private func applyImage() {
        guard let beer = beer else {
            beerImageView.image = nil
            return
        }
        
        beerImageView.af.setImage(withURL: URL(string: beer.imageURL)!)
    }
    
    private func applyLanguage() {
        guard let beer = beer else {
            beerAlcoholicStrengthLabel.text = String()
            beerBitternessLabel.text        = String()
            beerDescriptionLabel.text       = String()
            beerDescriptionTextView.text    = String()
            return
        }
        
        title = beer.name
        
        beerTaglineLabel.text           = beer.tagline
        beerAlcoholicStrengthLabel.text = "\(Constants.kAlcoholicStrength) \(beer.alcoholicStrength)"
        beerBitternessLabel.text        = "\(Constants.kBitterness) \(beer.bitterness)"
        beerDescriptionLabel.text       = Constants.kDescription
        beerDescriptionTextView.text    = beer.description
    }

    private func applyStyle() {
        beerTaglineLabel.font                               = .systemFont(ofSize: Constants.kThirteenFontSize)
        beerTaglineLabel.textColor                          = .lightGray
        
        beerAlcoholicStrengthLabel.font                     = .systemFont(ofSize: Constants.kSevenTeenFontSize)
        beerAlcoholicStrengthLabel.textColor                = .black
        
        beerBitternessLabel.font                            = .systemFont(ofSize: Constants.kSevenTeenFontSize)
        beerBitternessLabel.textColor                       = .black
        
        beerDescriptionLabel.font                           = .boldSystemFont(ofSize: Constants.kSevenTeenFontSize)
        beerDescriptionLabel.textColor                      = .black
        
        beerDescriptionTextView.allowsEditingTextAttributes = false
        beerDescriptionTextView.font                        = .systemFont(ofSize: Constants.kFourteenFontSize)
        beerDescriptionTextView.textColor                   = .black
        beerDescriptionTextView.textAlignment               = .justified
    }

}
