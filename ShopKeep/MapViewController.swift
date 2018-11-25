//
//  MapViewController.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/23/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: UIImageView!
    @IBOutlet weak var helpBtn: UIImageView!
    @IBOutlet weak var endTripBtn: UIButton!
    @IBOutlet weak var prevItemBtn: UIButton!
    @IBOutlet weak var nextItemBtn: UIButton!

    @IBOutlet weak var currItemLabel: UILabel!
    @IBOutlet weak var eggsBtn: UIButton!
    @IBOutlet weak var cheeseBtn: UIButton!
    @IBOutlet weak var pizzaBtn: UIButton!
    @IBOutlet weak var chickenBtn: UIButton!
    @IBOutlet weak var breadBtn: UIButton!

    var map: UIImage?
    var items = [String]()
    var currIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map = UIImage(named: "base_cvs_map")

        let list = ["Eggs", "Cheese", "Pizza", "Chicken", "Bread"]
        items = list
        items.append("All items done!")

        currItemLabel.text = "Eggs"
        eggsBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        cheeseBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        pizzaBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        chickenBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        breadBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)

        indexUpdated()

        // Do any additional setup after loading the view.
    }

    @objc func buttonClicked(sender:UIButton)
    {
        switch sender.tag
        {
        case 1: print("Eggs")     //when Button1 is clicked...
            break
        case 2: print("Cheese")     //when Button2 is clicked...
            break
        case 3: print("Pizza")     //when Button3 is clicked...
            break
        case 4: print("Chicken")     //when Button3 is clicked...
            break
        case 3: print("Bread")     //when Button3 is clicked...
            break
        default: print("Other...")
        }
    }

    @IBAction func rightArrowTapped(_ sender: Any) {
        print(items.count)
        print(currIndex)
        if currIndex + 1 <= items.count - 1{
            currIndex+=1
            indexUpdated()
        }
    }

    func indexUpdated(){
        let currItem = items[currIndex]
        currItemLabel.text = currItem

        if currIndex == items.count - 1 {
            nextItemBtn.isEnabled = false
            nextItemBtn.tintColor = UIColor.lightGray
        }

        let bigSize = CGSize(width: 51, height: 66)
        let normalSize = CGSize(width: 34, height: 44)

        switch currIndex {
        case 0:
            print("eggs resized")
            eggsBtn.frame.size = bigSize
            cheeseBtn.frame.size = normalSize

        case 1:
            print("cheese resized")
            eggsBtn.frame.size = normalSize
            cheeseBtn.frame.size = bigSize
            pizzaBtn.frame.size = normalSize
        case 2:
            print("pizza resized")
            cheeseBtn.frame.size = normalSize
            pizzaBtn.frame.size = bigSize
            chickenBtn.frame.size = normalSize
        case 3:
            print("chicken resized")
            pizzaBtn.frame.size = normalSize
            chickenBtn.frame.size = bigSize
            breadBtn.frame.size = normalSize
        case 4:
            print("bread resized")
            chickenBtn.frame.size = normalSize
            breadBtn.frame.size = bigSize

        default:
            print("default")
        }
    }
    @IBAction func leftArrowTapped(_ sender: Any) {
        if currIndex > 0 {
            currIndex-=1
            indexUpdated()
        }
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }


    func DrawOnImage(startingImage: UIImage) -> UIImage {

        // Create a context of the starting image size and set it as the current one
        UIGraphicsBeginImageContext(startingImage.size)

        // Draw the starting image in the current context as background
        startingImage.draw(at: CGPoint.zero)

        // Get the current context
        let context = UIGraphicsGetCurrentContext()!

        // Draw a red line
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.move(to: CGPoint(x: 100, y: 100))
        context.addLine(to: CGPoint(x: 200, y: 200))
        context.strokePath()

        // Draw a transparent green Circle
        context.setStrokeColor(UIColor.green.cgColor)
        context.setAlpha(0.5)
        context.setLineWidth(10.0)
        context.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
        context.drawPath(using: .stroke) // or .fillStroke if need filling

        // Save the context as a new UIImage
        let myImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // Return modified image
        return myImage!
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
