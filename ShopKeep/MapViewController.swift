//
//  MapViewController.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/23/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit


var customRed = UIColor.init(red: 196/255, green: 21/255, blue: 23/255, alpha: 100)
var customGreen = UIColor.init(red: 65/255, green: 117/255, blue: 5/255, alpha: 100)
var gold = UIColor.init(red: 252/255, green:194/255, blue:0/255, alpha:100)
var darkGold = UIColor.init(red: 209/255, green:183/255, blue:47/255, alpha:100)
var orange = UIColor.init(red: 245/255, green: 117/255, blue: 35/255, alpha:100)
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

    weak var shapeLayer: CAShapeLayer?

    let bigSize = CGSize(width: 40, height: 48)
    let normalSize = CGSize(width: 25, height: 30)

    var map: UIImage?
    var groceryList = [String]()
    var currIndex = 0
    var completeItemList = [String]()
    var btnArray = [UIButton]()
    var mainLayer = CALayer()

    override func viewDidAppear(_ animated: Bool) {
        completeItemList = ["eggs", "corn", "corn on the cob", "cheese", "brocolli", "lemons", "carrot", "carrots", "pizza", "burger", "burgers", "quesadillas", "quesadilla", "icecream", "ice cream", "chicken", "fish", "steak", "beef", "pasta", "bread"]
        btnArray = [eggsBtn, cornBtn, cheeseBtn, brocolliBtn, lemonBtn, carrotBtn, pizzaBtn, burgerBtn, quesadillaBtn, iceCreamBtn, chickenBtn, fishBtn, steakBtn, pastaBtn, breadBtn]
        //groceryList = ["eggs", "corn", "lemon", "quesadilla"]
        groceryList = ["eggs", "corn", "pizza", "bread"]
        setupButtons()

        drawPath(items: groceryList)


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        map = UIImage(named: "base_cvs_map")
        navItem.title = ""
        for btn in btnArray {
            btn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
            btn.isHidden = true
        }
    }

    @IBAction func rightArrowTapped(_ sender: Any) {
        print(groceryList.count)
        print(currIndex)
        if currIndex + 1 <= groceryList.count - 1{
            currIndex+=1
            indexUpdated()
        }
    }

    @IBAction func leftArrowTapped(_ sender: Any) {
        if currIndex > 0 {
            currIndex-=1
            indexUpdated()
        }
    }

    @IBAction func endTripPressed(_ sender: Any) {
        //Show goodbye vc
    }

    //To add an item to grocery list and update map / path
    func addItem(item: String) {
         groceryList.append(item)
         guard let sublayers = mapView.layer.sublayers else { return }
         for layer in sublayers {
            layer.removeFromSuperlayer()
         }
         drawPath(items: groceryList)
         setupButtons()
    }

    func indexUpdated(){
        if currIndex >= groceryList.count  {return}
        let currItem = groceryList[currIndex]
        currItemLabel.text = currItem

        if currIndex == 0 {
            prevItemBtn.isEnabled = false
            prevItemBtn.tintColor = UIColor.lightGray
        } else {
            prevItemBtn.isEnabled = true
            prevItemBtn.tintColor = UIColor.darkGray
        }

        if currIndex == groceryList.count - 1 {
            nextItemBtn.isEnabled = false
            nextItemBtn.tintColor = UIColor.lightGray
        } else {
            nextItemBtn.isEnabled = true
            nextItemBtn.tintColor = UIColor.darkGray
        }

        switch (currItem) {
        case "eggs":
            updateBtnSize(selected: eggsBtn)
            break
        case "corn", "canned corn", "corn on the cob":
            updateBtnSize(selected: cornBtn)
            break
        case "cheese", "parmesan", "cheddar":
            updateBtnSize(selected: cheeseBtn)
            break
        case "broccoli":
            updateBtnSize(selected: brocolliBtn)
            break
        case "lemon", "lemons":
            updateBtnSize(selected: lemonBtn)
            break
        case "carrot", "carrots":
            updateBtnSize(selected: carrotBtn)
            break
        case "pizza", "frozen pizza", "cheese pizza", "pepperoni pizza":
            updateBtnSize(selected: pizzaBtn)
            break
        case "burger", "burgers":
            updateBtnSize(selected: burgerBtn)
            break
        case "quesadilla", "quesadillas":
            updateBtnSize(selected: quesadillaBtn)
            break
        case "icecream", "ice cream":
            updateBtnSize(selected: iceCreamBtn)
            break
        case "chicken", "frozen chicken":
            updateBtnSize(selected: chickenBtn)
            break
        case "fish", "frozen fish":
            updateBtnSize(selected: fishBtn)
            break
        case "steak", "beef":
            updateBtnSize(selected: steakBtn)
            break
        case "pasta", "noodles":
            updateBtnSize(selected: pastaBtn)
            break
        case "bread", "baguette", "bread roll", "bread rolls":
            updateBtnSize(selected: breadBtn)
            break
        default:
            updateBtnSize(selected: nil)
            break
        }
    }

    func updateBtnSize(selected: UIButton?) {
        for btn in btnArray {
            if btn != selected {
                btn.frame.size = normalSize
                btn.layer.shadowOpacity = 0.0
            }
        }
        if let currBtn = selected {
            currBtn.frame.size = bigSize
            currBtn.layer.shadowColor = UIColor.lightGray.cgColor
            currBtn.layer.shadowOffset = CGSize(width: 0, height: 1)
            currBtn.layer.shadowOpacity = 1.0
            currBtn.layer.shadowRadius = 1
        }
    }

    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, mapview: UIView) {

        //self.shapeLayer?.removeFromSuperlayer()
        /*
        let path = UIBezierPath()
        path.move(to: p0)
        path.addLine(to: p1)
        path.close()
         */
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = colorArray[colorIndex%6].cgColor
        shapeLayer.strokeColor = colorArray[colorIndex%6].cgColor
        //shapeLayer.fillColor = customRed.cgColor
        //shapeLayer.strokeColor = customRed.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.opacity = 0.5
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path

        mapview.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 2
        shapeLayer.add(animation, forKey: "MyAnimation")

        //view.layer.addSublayer(shapeLayer)

        //self.shapeLayer = shapeLayer
        // save shape layer    }

    }

}

/*
class GridView: UIView
{
    private var path = UIBezierPath()

    fileprivate func drawGrid()
    {

        /*
        path = UIBezierPath()
        path.lineWidth = 5.0
        let blackColor = UIColor.black
        blackColor.setStroke()
        path.stroke()

        //All the way up right-most aisle
        let start1 = CGPoint(x: bounds.width - 35, y:bounds.height - 25)
        let end1 = CGPoint(x: bounds.width - 35, y: 25)
        path.move(to: start1)
        path.addLine(to: end1)

        //To Pizza
        let start2 = CGPoint(x: bounds.width - 35, y: 25)
        let end2 = CGPoint(x: bounds.width - 182.5, y: 25)
        path.move(to: start2)
        path.addLine(to: end2)

        //To burgers & quesadillas (ends at bottom of aisle 13/14)
        let start3 = CGPoint(x: bounds.width - 180, y: 25)
        let end3 = CGPoint(x: bounds.width - 180, y: bounds.height/2 - 35)
        path.move(to: start3)
        path.addLine(to: end3)

        //To ice cream
        let start4 = CGPoint(x: bounds.width - 180, y: bounds.height/2 - 35)
        let end4 = CGPoint(x: bounds.width - 180, y: bounds.height/2 + 70)
        path.move(to: start4)
        path.addLine(to: end4)

        //across aisle 12-13
        let start5 = CGPoint(x: bounds.width - 180, y: bounds.height/2 - 35)
        let end5 = CGPoint(x: bounds.width - 255, y: bounds.height/2 - 35)
        path.move(to: start5)
        path.addLine(to: end5)

        //to chicken (from end5)
        let start6a = CGPoint(x: bounds.width - 255, y: bounds.height/2 - 37.5)
        let end6a = CGPoint(x: bounds.width - 255, y: bounds.height/2 + 20)
        path.move(to: start6a)
        path.addLine(to: end6a)

        //to fish (from chicken)
        let start6b = CGPoint(x: bounds.width - 255, y: bounds.height/2 + 20)
        let end6b = CGPoint(x: bounds.width - 255, y: bounds.height/2 + 70)
        path.move(to: start6b)
        path.addLine(to: end6b)

        //to steak (from fish)
        let start6c = CGPoint(x: bounds.width - 255, y: bounds.height/2 + 70)
        let end6c = CGPoint(x: bounds.width - 255, y: bounds.height/2 + 138)
        path.move(to: start6c)
        path.addLine(to: end6c)

        //To pasta (across aisle 10-11)
        let start7 = CGPoint(x: bounds.width - 255, y: bounds.height/2 - 35)
        let end7 = CGPoint(x: bounds.width - 300, y: bounds.height/2 - 35)
        path.move(to: start7)
        path.addLine(to: end7)

        //To bread (from pasta)
        let start8a = CGPoint(x: bounds.width - 300, y: bounds.height/2 - 35)
        let end8a = CGPoint(x: bounds.width - 335, y: bounds.height/2 - 35)
        path.move(to: start8a)
        path.addLine(to: end8a)
        let start8b = CGPoint(x: bounds.width - 335, y: bounds.height/2 - 37.5)
        let end8b = CGPoint(x: bounds.width - 335, y: bounds.height/2 + 110)
        path.move(to: start8b)
        path.addLine(to: end8b)


        //Close the path.
        path.close()
    */
    }

    override func draw(_ rect: CGRect)
    {
        drawGrid()

        // Specify a border (stroke) color.
        customRed.setStroke()
        path.stroke()
        
    }
}
*/

extension MapViewController {

    func drawPath(items: [String]){

        addEdges()

        var vertices = [Vertex]()
        vertices.append(n1)

        //get all vertices from item list
        for item in items {
            if let vertex = getVertex(for : item) {
                if !vertices.contains(vertex) {
                    vertices.append(vertex)
                }
            }
        }

        //sort vertices by rough distance
        vertices = vertices.sorted { (first: Vertex, second: Vertex) -> Bool in
            if first == n1 {return true}
            if second == n1 {return false}

            if first.data.x != second.data.x {
                return first.data.x > second.data.x
            } else {
                return first.data.y > second.data.y
            }
        }

        //sort item list to reflect vertices order
        var tempItems = [String]()
        for vert in vertices {
            if let item = getItemName(for: vert) {
                tempItems.append(item)
            }
        }
        groceryList = tempItems
        currItemLabel.text = groceryList[0]
        groceryList.append("All items done!")
        indexUpdated()

        for (index, vertex) in vertices.enumerated() {
            if index >= vertices.count - 1 {break}
            let source = vertex
            let destination = vertices[index + 1]
            drawShortestPath(src: source, dst: destination)
        }

    }



    func drawShortestPath(src: Vertex, dst: Vertex) {

        //for edges in mst.edges(from: <#T##Vertex<CGPoint>#>)

        

        if let edges = adjacencyList.breadthFirstSearch(from: src, to: dst) {
            for edge in edges {
               // print("edge weight: \(edge.weight)")
                let srcPoint = edge.source.data
                let dstPoint = edge.destination.data
                drawDottedLine(start: srcPoint, end: dstPoint, mapview: mapView)
               // print("drawing path start to item 1")
               // print("\(edge.source) -> \(edge.destination)")
            }
            colorIndex+=1
        }
    }

    func addEdges(){
        adjacencyList.add(from: eggsCoord, to: n2, weight: Double(c2.y - eggs.y))
        adjacencyList.add(from: eggsCoord, to: n3, weight: Double(eggs.y - c2.y))
        adjacencyList.add(from: n1, to: n2, weight: Double(c1.y - c2.y))
        adjacencyList.add(from: n2, to: n5, weight: Double(c2.x - c5.x))
        adjacencyList.add(from: n3, to: n6, weight: Double(c3.x - c6.x))
        adjacencyList.add(from: n3, to: cornCoord, weight: Double(c3.y - corn.y))
        adjacencyList.add(from: cornCoord, to: cheeseCoord, weight: Double(corn.y - cheese.y))
        adjacencyList.add(from: cheeseCoord, to: broccoliCoord, weight: Double(cheese.y - broccoli.y))
        adjacencyList.add(from: broccoliCoord, to: lemonCoord, weight: Double(broccoli.y - lemon.y))
        adjacencyList.add(from: lemonCoord, to: n4, weight: Double(lemon.y - c4.y))
        adjacencyList.add(from: n4, to: carrotCoord, weight: Double(c4.x - carrot.x))
        adjacencyList.add(from: carrotCoord, to: n7, weight: Double(carrot.x - c7.x))
        adjacencyList.add(from: n7, to: pizzaCoord, weight: Double(pizza.y - c7.y))
        adjacencyList.add(from: pizzaCoord, to: burgerCoord, weight: Double(burger.y - pizza.y))
        adjacencyList.add(from: burgerCoord, to: quesadillaCoord, weight: Double(quesadilla.y - burger.y))
        adjacencyList.add(from: quesadillaCoord, to: n6, weight: Double(c6.y - quesadilla.y))
        adjacencyList.add(from: n6, to: iceCreamCoord, weight: Double(icecream.y - c6.y))
        adjacencyList.add(from: iceCreamCoord, to: n5, weight: Double(c5.y - icecream.y))
        adjacencyList.add(from: n6, to: n9, weight: Double(c6.x - c9.x))
        adjacencyList.add(from: n9, to: chickenCoord, weight: Double(chicken.y - c9.y))
        adjacencyList.add(from: chickenCoord, to: fishCoord, weight: Double(fish.y - chicken.y))
        adjacencyList.add(from: fishCoord, to: steakCoord, weight: Double(steak.y - fish.y))
        adjacencyList.add(from: steakCoord, to: n8, weight: Double(c8.y - steak.y))
        adjacencyList.add(from: pastaCoord, to: n11, weight: Double(pasta.x - c11.x))
        adjacencyList.add(from: pastaCoord, to: n9, weight: Double(c9.x - pasta.x))
        adjacencyList.add(from: n11, to: breadCoord, weight: Double(bread.y - c11.y))
        adjacencyList.add(from: breadCoord, to: n10, weight: Double(c10.y - bread.y))
        adjacencyList.add(from: n8, to: n10, weight: Double(c8.x - c10.x))
        adjacencyList.add(from: n8, to: n5, weight: Double(c5.x - c8.x))
    }

    //func getButtonFromString(str: String, array: [UIButton])
    func setupButtons(){

        //make all items lowercase
        var temp = [String]()
        for str in groceryList {
            temp.append(str.lowercased())
        }
        groceryList = temp

        //hide buttons
        print("printing buttons")
        for btn in btnArray {
            print("button tag: \(btn.tag)")
            //print("\(btn.tag) \(btn.frame.minX), \(btn.frame.minY)")
            btn.addTarget(self,action:#selector(buttonClicked), for:.touchUpInside)
            btn.isHidden = true
        }

        //unhide buttons for items in list
        let itemList = groceryList
        for item in itemList {
            print(item)
            switch (item) {
            case "eggs":
                eggsBtn.isHidden = false
                break
            case "corn", "canned corn", "corn on the cob":
                cornBtn.isHidden = false
                break
            case "cheese", "parmesan", "cheddar":
                cheeseBtn.isHidden = false
                break
            case "broccoli":
                brocolliBtn.isHidden = false
                break
            case "lemon", "lemons":
                lemonBtn.isHidden = false
                break
            case "carrot", "carrots":
                carrotBtn.isHidden = false
                break
            case "pizza", "frozen pizza", "cheese pizza", "pepperoni pizza":
                pizzaBtn.isHidden = false
                break
            case "burger", "burgers", "patties":
                burgerBtn.isHidden = false
                break
            case "quesadilla", "quesadillas":
                quesadillaBtn.isHidden = false
                break
            case "icecream", "ice cream":
                iceCreamBtn.isHidden = false
                break
            case "chicken", "frozen chicken":
                chickenBtn.isHidden = false
                break
            case "fish", "frozen fish":
                fishBtn.isHidden = false
                break
            case "steak", "beef":
                steakBtn.isHidden = false
                break
            case "pasta", "noodles":
                print("unhiding pasta")
                pastaBtn.isHidden = false
                break
            case "bread", "baguette", "bread roll", "bread rolls":
                breadBtn.isHidden = false
                break
            default:
                print("item does not match any button")
                break
            }
        }
    }

    //create item screens as needed
    @objc func buttonClicked(sender:UIButton)
    {
        switch sender.tag
        {
        case 1:
            let eggsImage = UIImage(named: "eggsBackground")
            let eggBrand1 = Brand(name: "EggsRUs", price: "$3.94/dz", discount: "Buy 1 Get 1")
            let eggBrand2 = Brand(name: "Luceme Organic", price: "$5.94/dz", discount: nil)
            let eggBrands = [eggBrand1, eggBrand2]
            let eggs = Item(name: "Eggs", brands: eggBrands, image: eggsImage!)

            let eggsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            eggsVC.type = eggs
            self.show(eggsVC, sender: self)
            break
        case 2:
            let cheeseImage = UIImage(named: "cheeseBackground")
            let cheeseBrand1 = Brand(name: "Le Chatelain", price: "$6.93/lb", discount: nil)
            let cheeseBrand2 = Brand(name: "Sargento Cheddar", price: "$3.94/lb", discount: "20% off")
            let cheeseBrands = [cheeseBrand1, cheeseBrand2]
            let cheese = Item(name: "Cheese", brands: cheeseBrands, image: cheeseImage!)

            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = cheese
            self.show(itemVC, sender: self)
            break
        case 3:
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
        case 4:
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
        case 5:
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
            break
        case 6:
            let lemonImage = UIImage(named: "lemonsBackground")
            let lemons1 = Brand(name: "CVS Lemons", price: "$1.00/unit", discount: nil)
            let lemonBrands = [lemons1]
            let lemons = Item(name: "Lemons", brands:  lemonBrands, image: lemonImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = lemons
            self.show(itemVC, sender: self)
            break
        case 7:
            let carrotImage = UIImage(named: "carrotsBackground")
            let carrots1 = Brand(name: "Green Giant Baby Cut", price: "$1.49/lb", discount: nil)
            let carrotBrands = [carrots1]
            let carrots = Item(name: "Carrots", brands:  carrotBrands, image: carrotImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = carrots
            self.show(itemVC, sender: self)
        case 8:
            let burgerImage = UIImage(named: "burgerBackground")
            let burger1 = Brand(name: "CVS Beef Patties", price: "$12.93/20-pack", discount: nil)
            let burger2 = Brand(name: "Sam's Choice Angus Beef", price: "$8.98/2lb", discount: nil)
            let burgerBrands = [burger1, burger2]
            let burger = Item(name: "Beef Patties", brands:  burgerBrands, image: burgerImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = burger
            self.show(itemVC, sender: self)
            break
        case 9:
            let quesadillaImage = UIImage(named: "quesadillaBackground")
            let quesadilla1 = Brand(name: "Smart Ones Chicken & Cheese", price: "$2.58/2-pack", discount: "20% Off")
            let quesadilla2 = Brand(name: "Smart Ones Steak & Cheese", price: "$3.28/2-pack", discount: "20% Off")
            let quesadillaBrands = [quesadilla1, quesadilla2]
            let quesadilla = Item(name: "Quesadillas", brands:  quesadillaBrands, image: quesadillaImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = quesadilla
            self.show(itemVC, sender: self)
            break
        case 10:
            let pastaImage = UIImage(named: "pastaBackground")
            let pasta1 = Brand(name: "Kraft Mac n' Cheese", price: "$13.93/6-pack", discount: "Buy 2 Get 1 Free")
            let pasta2 = Brand(name: "Barilla Penne", price: "$3.19/lb", discount: nil)
            let pasta3 = Brand(name: "DeCecco Rigatoni", price: "$3.41/lb", discount: nil)
            let pasta4 = Brand(name: "San Giorgio Spagetti", price: "$2.95/lb", discount: "10% Off")
            let pastaBrands = [pasta1, pasta2, pasta3, pasta4]
            let pasta = Item(name: "Pasta", brands:  pastaBrands, image: pastaImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = pasta
            self.show(itemVC, sender: self)
            break
        case 11:
            let fishImage = UIImage(named: "fishBackground")
            let fish1 = Brand(name: "CVS Alaskan Salmon", price: "$7.93/lb", discount: nil)
            let fishBrands = [fish1]
            let fish = Item(name: "Fish", brands:  fishBrands, image: fishImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = fish
            self.show(itemVC, sender: self)
            break
        case 12:
            let iceCreamImage = UIImage(named: "iceCreamBackground")
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
            break
        case 13:
            let steakImage = UIImage(named: "steakBackground")
            let steak1 = Brand(name: "CVS Rib-Eye", price: "$7.93/lb", discount: nil)
            let steak2 = Brand(name: "CVS NY Strip", price: "$9.93/lb", discount: nil)
            let steak3 = Brand(name: "CVS Filet Mignon", price: "$11.25/lb", discount: nil)

            let steakBrands = [steak1, steak2, steak3]
            let steak = Item(name: "Steak", brands:  steakBrands, image: steakImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = steak
            self.show(itemVC, sender: self)
            break
        case 14:
            let brocolliImage = UIImage(named: "broccoliBackground")
            let broccoli1 = Brand(name: "CVS Brocolli", price: "$5.44/lb", discount: nil)
            let brocolliBrands = [broccoli1]
            let brocolli = Item(name: "Broccoli", brands:  brocolliBrands, image: brocolliImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = brocolli
            self.show(itemVC, sender: self)
            break
        case 15:
            let cornImage = UIImage(named: "cornBackground")
            let corn1 = Brand(name: "CVS Corn on the Cob", price: "$1.50/ea", discount: "3 for $4.00")
            let cornBrands = [corn1]
            let corn = Item(name: "Corn", brands:  cornBrands, image: cornImage!)
            let itemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            itemVC.type = corn
            self.show(itemVC, sender: self)
            break
        default: print("Default called for button selection")
        }
    }
}


/*
 switch (currItem) {
 case completeItemList[0]:
 updateBtnSize(selected: eggsBtn)
 break
 case completeItemList[1]:
 updateBtnSize(selected: cornBtn)
 break
 case completeItemList[2]:
 updateBtnSize(selected: cheeseBtn)
 break
 case completeItemList[3]:
 updateBtnSize(selected: brocolliBtn)
 break
 case completeItemList[4]:
 updateBtnSize(selected: lemonBtn)
 break
 case completeItemList[5]:
 updateBtnSize(selected: carrotBtn)
 break
 case completeItemList[6]:
 updateBtnSize(selected: pizzaBtn)
 break
 case completeItemList[7]:
 updateBtnSize(selected: burgerBtn)
 break
 case completeItemList[8]:
 updateBtnSize(selected: quesadillaBtn)
 break
 case completeItemList[9]:
 updateBtnSize(selected: iceCreamBtn)
 break
 case completeItemList[10]:
 updateBtnSize(selected: chickenBtn)
 break
 case completeItemList[11]:
 updateBtnSize(selected: fishBtn)
 break
 case completeItemList[12]:
 updateBtnSize(selected: steakBtn)
 break
 case completeItemList[13]:
 updateBtnSize(selected: pastaBtn)
 break
 case completeItemList[14]:
 updateBtnSize(selected: breadBtn)
 break
 default:
 updateBtnSize(selected: nil)
 break
 }
 */
