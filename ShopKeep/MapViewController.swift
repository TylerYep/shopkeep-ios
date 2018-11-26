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

    @IBOutlet weak var eggsBtn: UIButton!        //tag 1
    @IBOutlet weak var cheeseBtn: UIButton!      //tag 2
    @IBOutlet weak var pizzaBtn: UIButton!       //tag 3
    @IBOutlet weak var chickenBtn: UIButton!     //tag 4
    @IBOutlet weak var breadBtn: UIButton!       //tag 5
    @IBOutlet weak var lemonBtn: UIButton!       //tag 6
    @IBOutlet weak var carrotBtn: UIButton!      //tag 7
    @IBOutlet weak var burgerBtn: UIButton!      //tag 8
    @IBOutlet weak var quesadillaBtn: UIButton!  //tag 9
    @IBOutlet weak var pastaBtn: UIButton!       //tag 10
    @IBOutlet weak var fishBtn: UIButton!        //tag 11
    @IBOutlet weak var iceCreamBtn: UIButton!    //tag 12
    @IBOutlet weak var steakBtn: UIButton!       //tag 13
    @IBOutlet weak var brocolliBtn: UIButton!    //tag 14
    @IBOutlet weak var cornBtn: UIButton!        //tag 15

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var navItem: UINavigationItem!

    var map: UIImage?
    var items = [String]()
    var currIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map = UIImage(named: "base_cvs_map")

        let list = ["Eggs", "Corn", "Cheese", "Brocolli", "Lemons", "Carrots", "Pizza", "Burgers", "Quesadillas", "Ice Cream", "Chicken", "Fish", "Streak", "Pasta", "Bread"]
        items = list
        items.append("All items done!")

        currItemLabel.text = "Eggs"
        eggsBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        cheeseBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        pizzaBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        chickenBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        breadBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        lemonBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        carrotBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        burgerBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        quesadillaBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        pastaBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        fishBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        iceCreamBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        steakBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        brocolliBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
        cornBtn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)

        indexUpdated()

        navItem.title = ""


        // Do any additional setup after loading the view.
    }

    @objc func buttonClicked(sender:UIButton)
    {
        switch sender.tag
        {
        case 1: print("Eggs")
            let eggsImage = UIImage(named: "eggsBackground")
            let eggBrand1 = Brand(name: "EggsRUs", price: "$3.94/dz", discount: "Buy 1 Get 1")
            let eggBrand2 = Brand(name: "Luceme Organic", price: "$5.94/dz", discount: nil)
            let eggBrands = [eggBrand1, eggBrand2]
            let eggs = Item(name: "Eggs", brands: eggBrands, image: eggsImage!)

            let eggsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            eggsVC.type = eggs
            self.show(eggsVC, sender: self)
            break
        case 2: print("Cheese")
            let cheeseImage = UIImage(named: "cheeseBackground")
            let cheeseBrand1 = Brand(name: "Le Chatelain", price: "$6.93/lb", discount: nil)
            let cheeseBrand2 = Brand(name: "Sargento Cheddar", price: "$3.94/lb", discount: "20% off")
            let cheeseBrands = [cheeseBrand1, cheeseBrand2]
            let cheese = Item(name: "Cheese", brands: cheeseBrands, image: cheeseImage!)

            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = cheese
            self.show(itemVC, sender: self)

        //when Button2 is clicked...
            break
        case 3: print("Pizza")
            let pizzaImage = UIImage(named: "pizzaBackground")
            let pizzaBrand1 = Brand(name: "DiGiorno", price: "$11.93/16in Pie", discount: nil)
            let pizzaBrand2 = Brand(name: "Freshetta", price: "$9.21/14in Pie", discount: nil)
            let pizzaBrand3 = Brand(name: "Hot Pockets", price: "$4.94/4-pack", discount: "Buy 2 Get 1 Free")
            let pizzaBrands = [pizzaBrand1, pizzaBrand2, pizzaBrand3]

            let pizza = Item(name: "Pizza", brands: pizzaBrands, image: pizzaImage!)

            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = pizza
            self.show(itemVC, sender: self)//when Button3 is clicked...
            break
        case 4: print("Chicken")
            let chickenImage = UIImage(named: "frozenChickenBackground")
            let chicken1 = Brand(name: "Tyson", price: "$18.43/40-pieces", discount: "15% off")
            let chicken2 = Brand(name: "Sanderson Homes", price: "$11.20/20-pieces", discount: nil)
            let chicken3 = Brand(name: "Pilgrim's", price: "$10.94/20-pieces", discount: "10% off")
            let chicken4 = Brand(name: "Perdue", price: "9.94/10-pieces", discount: nil)

            let chickenBrands = [chicken1, chicken2, chicken3, chicken4]
            let chicken = Item(name: "Frozen Chicken", brands: chickenBrands, image: chickenImage!)

            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = chicken
            self.show(itemVC, sender: self)
            break
        case 5: print("Bread")
            let breadImage = UIImage(named: "breadBackground")
            let bread1 = Brand(name: "Wonderbread", price: "$3.84/20oz", discount: nil)
            let bread2 = Brand(name: "Grupo Bimbo", price: "$4.04/24oz", discount: "15% off")
            let bread3 = Brand(name: "Nature's Grain", price: "$5.43/20oz", discount: nil)
            let bread4 = Brand(name: "Alvarado Baguettes", price: "$7.89/24oz", discount: nil)

            let breadBrands = [bread1, bread2, bread3, bread4]
            let bread = Item(name: "Bread", brands: breadBrands, image: breadImage!)

            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = bread
            self.show(itemVC, sender: self)
        //when Button3 is clicked...
            break

        case 6: print("Lemons")
            let lemonImage = UIImage(named: "lemonsBackground")
            let lemons1 = Brand(name: "CVS Lemons", price: "$1.00/unit", discount: nil)
            let lemonBrands = [lemons1]
            let lemons = Item(name: "Lemons", brands:  lemonBrands, image: lemonImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = lemons
            self.show(itemVC, sender: self)

        case 7: print("carrots")
            let carrotImage = UIImage(named: "lemonsBackground")
            let carrots1 = Brand(name: "CVS Carrots", price: "$1.20/lb", discount: nil)
            let carrotBrands = [carrots1]
            let carrots = Item(name: "Carrots", brands:  carrotBrands, image: carrotImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = carrots
            self.show(itemVC, sender: self)

        case 8: print("burgers")
            let burgerImage = UIImage(named: "lemonsBackground")
            let burger1 = Brand(name: "CVS Beef Patties", price: "$12.93/20-pack", discount: nil)
            let burgerBrands = [burger1]
            let burger = Item(name: "Burger Patties", brands:  burgerBrands, image: burgerImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = burger
            self.show(itemVC, sender: self)

        case 9: print("quesadillas")
            let quesadillaImage = UIImage(named: "lemonsBackground")
            let quesadilla1 = Brand(name: "CVS Frozen Quesadillas", price: "$18.93/40-pack", discount: "Buy 1 Get 1 50% Off")
            let quesadillaBrands = [quesadilla1]
            let quesadilla = Item(name: "Quesadillas", brands:  quesadillaBrands, image: quesadillaImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = quesadilla
            self.show(itemVC, sender: self)

        case 10: print("pasta")
            let pastaImage = UIImage(named: "lemonsBackground")
            let pasta1 = Brand(name: "Kraft Mac n' Cheese", price: "$13.93/6-pack", discount: "Buy 2 Get 1 Free")
            let pastaBrands = [pasta1]
            let pasta = Item(name: "Pasta", brands:  pastaBrands, image: pastaImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = pasta
            self.show(itemVC, sender: self)

        case 11: print("fish")
            let fishImage = UIImage(named: "lemonsBackground")
            let fish1 = Brand(name: "CVS Alaskan Salmon", price: "$7.93/lb", discount: nil)
            let fishBrands = [fish1]
            let fish = Item(name: "Fish", brands:  fishBrands, image: fishImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = fish
            self.show(itemVC, sender: self)

        case 12: print("ice cream")

            let iceCreamImage = UIImage(named: "lemonsBackground")
            let iceCream1 = Brand(name: "Halo Top Vanilla", price: "$4.55/pint", discount: nil)
            let iceCream2 = Brand(name: "Halo Top Mint Chip", price: "$4.55/pint", discount: nil)
            let iceCream3 = Brand(name: "Halo Top Cookie Dough", price: "$4.55/pint", discount: nil)
            let iceCream4 = Brand(name: "Halo Top Chocolate", price: "$4.55/pint", discount: nil)
            let iceCream5 = Brand(name: "Ben n Jerry's Phish Food", price: "$3.94/pint", discount: nil)
            let iceCreamBrands = [iceCream1, iceCream2, iceCream3, iceCream4, iceCream5]
            let iceCream = Item(name: "Ice  Cream", brands:  iceCreamBrands, image: iceCreamImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = iceCream
            self.show(itemVC, sender: self)

        case 13: print("steak")
            let steakImage = UIImage(named: "lemonsBackground")
            let steak1 = Brand(name: "CVS Rib-Eye", price: "$7.93/lb", discount: nil)
            let steak2 = Brand(name: "CVS NY Strip", price: "$9.93/lb", discount: nil)
            let steak3 = Brand(name: "CVS Filet Mignon", price: "$11.25/lb", discount: nil)

            let steakBrands = [steak1, steak2, steak3]
            let steak = Item(name: "Steak", brands:  steakBrands, image: steakImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = steak
            self.show(itemVC, sender: self)

        case 14: print("brocolli")
            let brocolliImage = UIImage(named: "lemonsBackground")
            let broccoli1 = Brand(name: "CVS Brocolli", price: "$5.44/lb", discount: nil)
            let brocolliBrands = [broccoli1]
            let brocolli = Item(name: "Broccoli", brands:  brocolliBrands, image: brocolliImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = brocolli
            self.show(itemVC, sender: self)
        case 15: print("corn")
            let cornImage = UIImage(named: "lemonsBackground")
            let corn1 = Brand(name: "CVS Corn on the Cob", price: "$3.44/lb", discount: nil)
            let corn2 = Brand(name: "CVS Street Corn", price: "$5.44/lb", discount: nil)

            let cornBrands = [corn1, corn2]
            let corn = Item(name: "Corn", brands:  cornBrands, image: cornImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = corn
            self.show(itemVC, sender: self)
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
