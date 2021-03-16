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
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActivityIndicator()
        setupTableView()
        
        loadBeerList { [weak self] in
          guard let strongSelf = self else { return }
          strongSelf.tableView.reloadData()
        }
    }
    
    //MARK: Functions
    private func setupActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    private func setupTableView() {
        tableView.register(cellType: BeerCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    func loadBeerList(completion: @escaping CompletionBlock.Empty) {
        if beersList.count == Int() || page == Constants.kInitialPage {
            beersList = [Beer]()
        }
        
        activityIndicator.startAnimating()
        
        if Network.shared.isConnectedToInternet() {
          Network.shared.fetchBeers(page: page) { [weak self] beers, _ in
            
            self?.activityIndicator.stopAnimating()
            
            guard let strongSelf = self else { completion(); return }
            
            if let items = self?.beersList, items.count > Int() {
              strongSelf.beersList.append(contentsOf: items)
              if let noDuplicates = strongSelf.beersList.noDuplicates() {
                strongSelf.beersList = noDuplicates
              }
                strongSelf.page += BeersListViewController.Constants.kPageIncrement
                self?.tableView.reloadData()
            }
            completion()
          }
        } else {
          completion()
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
        cell.beer = beersList[indexPath.row]
        
        return cell
    }
    
    
}

// MARK: UITableViewDelegate
extension BeersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let beersDetailsViewController = StoryboardReusable.beersDetailsViewController() else { return }
        
        beersDetailsViewController.beer = beersList[indexPath.row]
        
        self.navigationController?.pushViewController(beersDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let items = beersList
        let lastIndex = items.count - 1
        if indexPath.item == lastIndex {
            self.loadBeerList {
                self.tableView.reloadData()
            }
        }
    }
}
