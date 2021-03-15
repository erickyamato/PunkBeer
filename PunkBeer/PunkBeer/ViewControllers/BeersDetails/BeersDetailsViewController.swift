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
        static let kName              = "Name:"
        static let kAlcoholicStrength = "Alcoholic strength:"
        static let kBitterness        = "Bitterness:"
        static let kDescription       = "Desciption"
    }
    
    var id: Int
    var beer: Beer
    
    init(id: Int, beer: Beer) {
        self.id = id
        self.beer = beer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Outlets
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerAlcoholicStrengthLabel: UILabel!
    @IBOutlet weak var beerBitternessLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var beerDescriptionTextView: UITextView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyLanguage()
        applyStyle()
    }
    
    private func applyLanguage() {
        beerNameLabel.text              = "\(Constants.kName)"
        beerAlcoholicStrengthLabel.text = "\(Constants.kAlcoholicStrength)"
        beerBitternessLabel.text        = "\(Constants.kBitterness)"
        beerDescriptionLabel.text       = Constants.kDescription
    }

    private func applyStyle() {
        beerNameLabel.font                   = .systemFont(ofSize: 17)
        beerNameLabel.textColor              = .black
        
        beerTaglineLabel.font                = .systemFont(ofSize: 13)
        beerTaglineLabel.textColor           = .lightGray
        
        beerAlcoholicStrengthLabel.font      = .systemFont(ofSize: 17)
        beerAlcoholicStrengthLabel.textColor = .black
        
        beerBitternessLabel.font             = .systemFont(ofSize: 17)
        beerBitternessLabel.textColor        = .black
        
        beerDescriptionLabel.font            = .boldSystemFont(ofSize: 17)
        beerDescriptionLabel.textColor       = .black
        
        beerDescriptionTextView.font         = .systemFont(ofSize: 14)
        beerDescriptionTextView.textColor    = .black
    }

}
