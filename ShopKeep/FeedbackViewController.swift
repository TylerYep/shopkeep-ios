//
//  FeedbackViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 12/8/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var feedbackTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // headshot
        headshotImageView.layer.cornerRadius = headshotImageView.frame.size.width / 2
        headshotImageView.clipsToBounds = true
        headshotImageView.layer.borderWidth = 8.0
        headshotImageView.layer.borderColor = UIColor.white.cgColor
        
        // textview
        feedbackTextView.layer.borderWidth = 1.0
        feedbackTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
