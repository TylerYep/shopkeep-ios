//
//  ViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 11/17/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // corner radius
        storeView.layer.cornerRadius = 20
        
        // border
//        storeView.layer.borderWidth = 1.0
//        storeView.layer.borderColor = UIColor.black.cgColor
        
        // shadow
//        storeView.layer.shadowColor = UIColor.black.cgColor
//        storeView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        storeView.layer.shadowOpacity = 0.7
//        storeView.layer.shadowRadius = 4.0
    }


}

