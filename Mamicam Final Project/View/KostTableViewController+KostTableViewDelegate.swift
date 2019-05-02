//
//  KostTableViewController+KostTableViewDelegate.swift
//  Mamicam Final Project
//
//  Created by icungse on 02/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailKostViewController") as? DetailKostViewController {
            controller.kostModel = self.kostViewModel.listKost[indexPath.row]
            controller.title = self.kostViewModel.listKost[indexPath.row].name
            controller.roomId = self.kostViewModel.listKost[indexPath.row].id
            
            self.show(controller, sender: self)
            print("click")
        } else {
            print("Something error opening detail kost")
        }
    }
}
