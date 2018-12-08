//
//  HelpViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 12/6/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // headshot
        headshotImageView.layer.cornerRadius = headshotImageView.frame.size.width / 2
        headshotImageView.clipsToBounds = true
        headshotImageView.layer.borderWidth = 8.0
        headshotImageView.layer.borderColor = UIColor.white.cgColor
        
        // border
        detailView.layer.borderWidth = 3.0
        detailView.layer.borderColor = UIColor.white.cgColor
        
        // shadow
        detailView.layer.shadowColor = UIColor.black.cgColor
        detailView.layer.shadowOffset = CGSize(width: 3, height: 3)
        detailView.layer.shadowOpacity = 0.7
        detailView.layer.shadowRadius = 4.0
        
        experienceLabel.text = "CVS Worker \n 5 years"
        
        detailLabel.text = "Health & Wellness, \nVegan Foods"

    }
    
    @IBAction func callButtonPressed(_ sender: Any) {
        facetime(phoneNumber: "3106252562")
    }
    
    private func facetime(phoneNumber:String) {
        if let facetimeURL:NSURL = NSURL(string: "facetime://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(facetimeURL as URL)) {
                application.openURL(facetimeURL as URL)
            }
        }
        print("call ends")
    }
}
