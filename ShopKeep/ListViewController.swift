//
//  ListViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 11/18/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var penButton: UIButton!
    @IBOutlet weak var micButton: UIButton!
    
    override func viewDidLoad() {
        // border
        itemView.layer.borderWidth = 1.0
        itemView.layer.borderColor = UIColor.black.cgColor
        
        // shadow
        itemView.layer.shadowColor = UIColor.black.cgColor
        itemView.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemView.layer.shadowOpacity = 0.7
        itemView.layer.shadowRadius = 4.0
        
        penButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        micButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TODO
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = "TEST" // TODO
        return cell
    }
    
}
