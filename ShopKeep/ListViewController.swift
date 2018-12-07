//
//  ListViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 11/18/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit
import Speech

struct ItemInput {
    var itemName: String
    var stockString: String
}
class ListViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource,
    UITextFieldDelegate {

    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!

    var inputItemList: [String] = []

    var itemList = [ItemInput]()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        for item in itemList {
            if item.stockString == "In Stock" {
                inputItemList.append(item.itemName)
            }
        }
        if segue.identifier == "segueToMap" {
            if let mapVC = segue.destination as? MapViewController {
                mapVC.groceryList = inputItemList
            }
        }
    }
    override func viewDidLoad() {

        //self.requestSpeechAuthorization()

        // border
        itemView.layer.borderWidth = 1.0
        itemView.layer.borderColor = UIColor.black.cgColor

        // shadow
        itemView.layer.shadowColor = UIColor.black.cgColor
        itemView.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemView.layer.shadowOpacity = 0.7
        itemView.layer.shadowRadius = 4.0

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // TODO
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        cell.selectionStyle = .none
        //cell.configure(text: "", placeholder: "")
        cell.itemTextField.delegate = self
        cell.itemTextField.autocapitalizationType = .words
        cell.itemTextField.tag = indexPath.row
        if indexPath.row < itemList.count {
            let item = itemList[indexPath.row]
            cell.setCell(itemName: item.itemName.capitalized, stockString: item.stockString)
        //        cell.stockLabel.text = "default"
        }
        return cell
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        var input = textField.text!
        print("textfield text is \(textField.text)")
        let indexPath = IndexPath(row: textField.tag, section: 1)
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        input = input.lowercased().trimmingCharacters(in: .whitespaces)
        cell.stockLabel.text = "Hi"
        print(input)
        if !input.isAlphanumeric() {
            let newItem = ItemInput(itemName: input, stockString: "Unrecognized")
            print("Unrecognized")
        } else if stockItems.contains(input) {
            let newItem = ItemInput(itemName: input, stockString: "In Stock")
            itemList.append(newItem)
            print("In Stock")
            //inputItemList.append(input)
        } else {
            let newItem = ItemInput(itemName: input, stockString: "Out of Stock")
            itemList.append(newItem)
            print("Out of Stock")
        }
        itemTableView.reloadData()

        return true
    }

    @IBAction func stockButtonPressed(_ sender: Any) {

        for cell in itemTableView.visibleCells as! [ItemTableViewCell] {
            //            cell.stockLabel.text = "updated"
            //do someting with the cell here.
            guard var input = cell.itemTextField.text else {
                print("nil input in table cell")
                continue
            }
            if input.isEmpty { continue }
            input = input.lowercased().trimmingCharacters(in: .whitespaces)
            print(input)
            if !input.isAlphanumeric() {
                cell.stockLabel.text = "Unrecognized"
                cell.stockLabel.textColor = .blue
                print("Unrecognized")
            } else if stockItems.contains(input) {
                cell.stockLabel.text = "In Stock"
                print("In Stock")
                inputItemList.append(input)
            } else {
                cell.stockLabel.text = "Out of Stock"
                cell.stockLabel.textColor = .red
                print("Out of Stock")
            }
        }

        print(inputItemList)
    }

}

extension String {

    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }

    func isAlphanumeric(ignoreDiacritics: Bool = false) -> Bool {
        if ignoreDiacritics {
            return self.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil && self != ""
        }
        else {
            return self.isAlphanumeric()
        }
    }

}
