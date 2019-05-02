//
//  NewKostViewController.swift
//  Mamicam Final Project
//
//  Created by icungse on 03/05/19.
//  Copyright © 2019 icung. All rights reserved.
//

import UIKit

class NewKostViewController: UIViewController {
    
    let url = "https://esjeruks.com/api-mamicamp/public/api/room"
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var typeSegemntedControl: UISegmentedControl!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextFIeld: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if isValidate() {
            let parameters = [
                "name": nameTextField.text,
                "description": descriptionTextFIeld.text,
                "type": typeSegemntedControl.titleForSegment(at: typeSegemntedControl.selectedSegmentIndex),
                "price": priceTextField.text,
                "category": categoryTextField.text
            ]
            NetworkFacade.callPostApi(url: url, parameters: parameters as [String : Any]) { json in
                print(json)
            }
        } else {
            let alert = UIAlertController(title: "Kost Gagal Disimpan", message: "Periksa kembali form yang diisi. Pastikan form terisi dan panjang karakter lebih dari 3", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    func isValidate() -> Bool {
        var isValid = true
        if nameTextField.text?.isEmpty == true || (nameTextField.text?.count)! < 3 {
            isValid = false
        }
        
        if descriptionTextFIeld.text?.isEmpty == true || (descriptionTextFIeld.text?.count)! < 3 {
            isValid = false
        }
        
        if priceTextField.text?.isEmpty == true || (priceTextField.text?.count)! < 3 {
            isValid = false
        }
        
        return isValid
    }
    
    
}
