//
//  KostTableViewController+TableViewDataSource.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KostTableViewCell", for: indexPath) as! KostTableViewCell
        
        cell.nameKostLabel.text = self.kostViewModel.listKost[indexPath.row].name
        cell.detailKostLabel.text = self.kostViewModel.listKost[indexPath.row].type
        cell.priceKostLabel.text = " - " + self.kostViewModel.listKost[indexPath.row].price
        cell.categoryKostLabel.text = self.kostViewModel.listKost[indexPath.row].category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.kostViewModel.listKost.count
    }
}

extension ViewController: KostViewModelDelegate {
    func onKostLoaded() {
        self.kostTableView.reloadData()
    }
}
