//
//  BeersListViewController.swift
//  PunkBeer
//
//  Created by Erick Mitsugui Yamato on 11/03/21.
//  Copyright © 2021 Erick Yamato. All rights reserved.
//

import UIKit

class BeersListViewController: UIViewController {

    private enum Constants {
        
    }
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: Functions
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: BeerCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

}

//MARK: UITableViewDataSource
extension BeersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currenciesListItems.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BeerCell = tableView.dequeueReusableCell(for: indexPath)
//        let item = currenciesListItems[indexPath.row]
//        cell.setup(code: item.code, name: item.name)
        return cell
    }
}

// MARK: UITableViewDelegate
extension BeersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _: BeerCell = tableView.dequeueReusableCell(for: indexPath)
//        let item = currenciesListItems[indexPath.row]
       
        
        
    }
    
}
