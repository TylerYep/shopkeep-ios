//
//  HardData.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/30/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

extension CGPoint: Hashable {

    public static func == (lhs: CGPoint, rhs: CGPoint) -> Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y)

    }

    public var hashValue: Int { // 1
        return "\(x)\(y)".hashValue
    }
}
let verticalMidpoint = screenHeight * (520/667) * (225 / 523)
let horizontalMidpoint = screenWidth * (195/375)
let bottomLine = screenHeight * (523/667) * (470/523)
let aisle18 = screenWidth - 35

let adjacencyList = AdjacencyList()
let eggsCoord = adjacencyList.createVertex(data: eggs)
let pizzaCoord = adjacencyList.createVertex(data: pizza)
let burgerCoord = adjacencyList.createVertex(data: burger)
let quesadillaCoord = adjacencyList.createVertex(data: quesadilla)
let iceCreamCoord = adjacencyList.createVertex(data: icecream)
let chickenCoord = adjacencyList.createVertex(data: chicken)

let lemonCoord = adjacencyList.createVertex(data: lemon)
let carrotCoord = adjacencyList.createVertex(data: carrot)

let pastaCoord = adjacencyList.createVertex(data: pasta)
let fishCoord = adjacencyList.createVertex(data: fish)
let steakCoord = adjacencyList.createVertex(data: steak)
let breadCoord = adjacencyList.createVertex(data: bread)

let cornCoord = adjacencyList.createVertex(data: corn)
let cheeseCoord = adjacencyList.createVertex(data: cheese)
let broccoliCoord = adjacencyList.createVertex(data: broccoli)


let n1 = adjacencyList.createVertex(data: c1)
let n2 = adjacencyList.createVertex(data: c2)
let n3 = adjacencyList.createVertex(data: c3)
let n4 = adjacencyList.createVertex(data: c4) //top right corner
let n5 = adjacencyList.createVertex(data: c5)

let n6 = adjacencyList.createVertex(data: c6)
let n7 = adjacencyList.createVertex(data: c7)
let n8 = adjacencyList.createVertex(data: c8)
let n9 = adjacencyList.createVertex(data: c9)

let n10 = adjacencyList.createVertex(data: c10)
let n11 = adjacencyList.createVertex(data: c11)

enum Coords: String {
    case eggs = "eggs"
    case corn = "corn"
    case cheese = "cheese"
    case brocolli = "broccoli"
    case lemon = "lemon"
    case carrot = "carrot"
    case pizza = "pizza"
    case burger = "burger"
    case quesadilla = "quesadilla"
    case icecream = "icecream"
    case chicken = "chicken"
    case fish = "fish"
    case steak = "steak"
    case pasta = "pasta"
    case bread = "bread"
    case c1 = "c1"
    case c2 = "c2"
    case c3 = "c3"
    case c4 = "c4"
    case c5 = "c5"
    case c6 = "c6"
    case c7 = "c7"
    case c8 = "c8"
    case c9 = "c9"
    case c10 = "c10"
    case c11 = "c11"
}
let eggs = CGPoint(x: aisle18, y: 425.0) //342
let pizza = CGPoint(x: horizontalMidpoint, y: 30.0) //195
let burger = CGPoint(x: horizontalMidpoint, y: 136.0)
let quesadilla = CGPoint(x: horizontalMidpoint, y: 170.0)
let icecream = CGPoint(x: horizontalMidpoint, y: 356.0)
let chicken = CGPoint(x: 115.0, y: 275.0)
let lemon = CGPoint(x: aisle18, y: 75.0)
let carrot = CGPoint(x: 286.0, y: 30.0)
let pasta = CGPoint(x: 75.0, y: verticalMidpoint) //225
let fish = CGPoint(x: 115.0, y: 320.0)
let steak = CGPoint(x: 115.0, y: 390.0)
let bread = CGPoint(x: 42.0, y: 356.0)
let corn = CGPoint(x: aisle18, y: 230.0)
let cheese = CGPoint(x: aisle18, y: 170.0)
let broccoli = CGPoint(x: aisle18, y: 130.0)
let c1 = CGPoint(x: aisle18, y: 505.0)
let c2 = CGPoint(x: aisle18, y: bottomLine) //470
let c3 = CGPoint(x: aisle18, y: verticalMidpoint)
let c4 = CGPoint(x: aisle18, y: 30.0)
let c5 = CGPoint(x: horizontalMidpoint, y: bottomLine)
let c6 = CGPoint(x: horizontalMidpoint, y: verticalMidpoint)
let c7 = CGPoint(x: horizontalMidpoint, y: 30.0)
let c8 = CGPoint(x: 115.0, y: bottomLine)
let c9 = CGPoint(x: 115.0, y: verticalMidpoint)
let c10 = CGPoint(x: 42.0, y: bottomLine)
let c11 = CGPoint(x: 42.0, y: verticalMidpoint)

let colorArray = [UIColor.red, orange, darkGold, customGreen, UIColor.blue, UIColor.purple]
var colorIndex = 0

func getVertex(for item: String)->Vertex?  {
    switch item {
    case "eggs":
        return eggsCoord
    case "pizza", "frozen pizza", "cheese pizza", "pepperoni pizza":
        return pizzaCoord
    case "burger", "burgers":
        return burgerCoord
    case "quesadilla", "quesadillas":
        return quesadillaCoord
    case "icecream", "ice cream":
        return iceCreamCoord
    case "chicken", "frozen chicken":
        return chickenCoord
    case "lemon", "lemons":
        return lemonCoord
    case "carrot", "carrots":
        return carrotCoord
    case "pasta", "noodles":
        return pastaCoord
    case "fish", "frozen fish":
        return fishCoord
    case "steak", "beef":
        return steakCoord
    case "bread", "baguette", "bread roll", "bread rolls":
        return breadCoord
    case "corn", "canned corn", "corn on the cob":
        return cornCoord
    case "cheese", "parmesan", "cheddar":
        return cheeseCoord
    case "broccoli":
        return broccoliCoord
    default:
        print("default case")
        return nil
    }
}

func getPoint(for vertex: Vertex)->CGPoint?  {
    switch vertex {
    case eggsCoord:
        return eggs
    case pizzaCoord:
        return pizza
    case burgerCoord:
        return burger
    case quesadillaCoord:
        return quesadilla
    case iceCreamCoord:
        return icecream
    case chickenCoord:
        return chicken
    case lemonCoord:
        return lemon
    case carrotCoord:
        return carrot
    case pastaCoord:
        return pasta
    case fishCoord:
        return fish
    case steakCoord:
        return steak
    case breadCoord:
        return bread
    case cornCoord:
        return corn
    case cheeseCoord:
        return cheese
    case broccoliCoord:
        return broccoli
    case n1:
        return c1
    case n2:
        return c2
    case n3:
        return c3
    case n4:
        return c4
    case n5:
        return c5
    case n6:
        return c6
    case n7:
        return c7
    case n8:
        return c8
    case n9:
        return c9
    case n10:
        return c10
    case n11:
        return c11
    default:
        print("default case")
        return nil
    }
}

func getItemName(for vertex: Vertex)->String?  {
    switch (vertex.data) {
    case eggs:
        return "eggs"
    case pizza:
        return "pizza"
    case burger:
        return "burger"
    case quesadilla:
        return "quesadilla"
    case icecream:
        return "ice cream"
    case chicken:
        return "chicken"
    case lemon:
        return "lemon"
    case carrot:
        return "carrots"
    case pasta:
        return "pasta"
    case fish:
        return "fish"
    case steak:
        return "steak"
    case bread:
        return "bread"
    case corn:
        return "corn"
    case cheese:
        return "cheese"
    case broccoli:
        return "broccoli"
    default:
        print("default case")
        return nil
    }
}
