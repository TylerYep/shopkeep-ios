//
//  FeedbackViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 12/8/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController, UITextViewDelegate {
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
        feedbackTextView.returnKeyType = .done
        feedbackTextView.delegate = self
        
        feedbackTextView.text = "Any additional feedback for Ellen?"
        feedbackTextView.textColor = UIColor.lightGray
        
    }
  
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Any additional feedback for Ellen?"
            textView.textColor = UIColor.lightGray
        }
    }
}
