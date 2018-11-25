//
//  ItemViewController.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/25/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit


class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!

    var type: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type!.brands.count + 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = type!

        switch (indexPath.row)
        {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell")
            cell?.imageView?.image = item.image
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell")
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell") as! BrandTableViewCell
            let brands = item.brands
            let curr = brands[indexPath.row - 2]
            cell.name.text = curr.name
            cell.price.text = curr.price
            if curr.discount == nil {
                cell.discount.isHidden = true
            } else {
                cell.discount.text = curr.discount
            }

            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.row) {
            case 0: return 136
            case 1: return 44
            default: return 80
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
