//
//  BeersListViewController.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit
import AlamofireImage

class BeersListViewController: UIViewController {

    private enum Constants {
        static let kPageIncrement = 1
        static let kInitialPage   = 1
    }
    
    private var page = 1
    var beersList = [Beer]()

    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Functions
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: BeerCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    func loadBeerList(completion: @escaping CompletionBlock.Empty) {
        if beersList.count == Int() || page == Constants.kInitialPage {
            beersList = [Beer]()
        }
        
        
        
    }

}

//MARK: UITableViewDataSource
extension BeersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BeerCell = tableView.dequeueReusableCell(for: indexPath)
        let item = beersList[indexPath.row]
        let beerImageUrl = item.imageURL
        cell.beerImageView.af.setImage(
            withURL:  URL(string: beerImageUrl)!,
            filter: nil,
            imageTransition: UIImageView.ImageTransition.crossDissolve(0.5),
            runImageTransitionIfCached: false) {
                response in
                    if response.response != nil {
                        self.tableView.beginUpdates()
                        self.tableView.endUpdates()
                    }
            }
//        cell.setup(beerImage: item.imageURL ,
//                   beerName: item.name,
//                   alcoholicStrength: String(item.alcoholicStrength))
        return cell
    }
}

// MARK: UITableViewDelegate
extension BeersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _: BeerCell = tableView.dequeueReusableCell(for: indexPath)
        let item = beersList[indexPath.row]
       
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}
