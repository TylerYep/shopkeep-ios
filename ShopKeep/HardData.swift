//
//  HardData.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/30/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

let adjacencyList = AdjacencyList<String>()
let eggsCoord = adjacencyList.createVertex(data: Coords.eggs.rawValue)
let pizzaCoord = adjacencyList.createVertex(data: "(170, 50)")
let burgerCoord = adjacencyList.createVertex(data: "(170, 136)")
let quesadillaCoord = adjacencyList.createVertex(data: "(170, 186)")
let iceCreamCoord = adjacencyList.createVertex(data: "(170, 356)")
let chickenCoord = adjacencyList.createVertex(data: "(85, 304)")

let lemonCoord = adjacencyList.createVertex(data: "(335, 75)")
let carrotCoord = adjacencyList.createVertex(data: "(286, 50)")

let pastaCoord = adjacencyList.createVertex(data: "(55, 187)")
let fishCoord = adjacencyList.createVertex(data: "(85, 356)")
let steakCoord = adjacencyList.createVertex(data: "(85, 422)")
let breadCoord = adjacencyList.createVertex(data: "(30, 393)")

let cornCoord = adjacencyList.createVertex(data: "(335, 230)")
let cheeseCoord = adjacencyList.createVertex(data: "(335, 191)")
let broccoliCoord = adjacencyList.createVertex(data: "(335, 130)")


let n1 = adjacencyList.createVertex(data: "(335, 479)")
let n2 = adjacencyList.createVertex(data: "(335, 445)")
let n3 = adjacencyList.createVertex(data: "(335, 187)")
let n4 = adjacencyList.createVertex(data: "(335, 50)") //top right corner
let n5 = adjacencyList.createVertex(data: "(170, 445)")

let n6 = adjacencyList.createVertex(data: "(170, 187)")
let n7 = adjacencyList.createVertex(data: "(170, 50)")
let n8 = adjacencyList.createVertex(data: "(85, 445)")
let n9 = adjacencyList.createVertex(data: "(85, 187)")

let n10 = adjacencyList.createVertex(data: "(30, 445)")
let n11 = adjacencyList.createVertex(data: "(30, 187)")

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

let eggs = CGPoint(x: 335.0, y: 434.0)
let pizza = CGPoint(x: 190.0, y: 50.0)
let burger = CGPoint(x: 190.0, y: 136.0)
let quesadilla = CGPoint(x: 190.0, y: 170.0)
let icecream = CGPoint(x: 190.0, y: 356.0)
let chicken = CGPoint(x: 115.0, y: 304.0)
let lemon = CGPoint(x: 335.0, y: 75.0)
let carrot = CGPoint(x: 286.0, y: 50.0)
let pasta = CGPoint(x: 55.0, y: 225.0)
let fish = CGPoint(x: 115.0, y: 356.0)
let steak = CGPoint(x: 115.0, y: 422.0)
let bread = CGPoint(x: 30.0, y: 393.0)
let corn = CGPoint(x: 335.0, y: 230.0)
let cheese = CGPoint(x: 335.0, y: 170.0)
let broccoli = CGPoint(x: 335.0, y: 130.0)
let c1 = CGPoint(x: 335.0, y: 479.0)
let c2 = CGPoint(x: 335.0, y: 470.0)
let c3 = CGPoint(x: 335.0, y: 225.0)
let c4 = CGPoint(x: 335.0, y: 50.0)
let c5 = CGPoint(x: 190.0, y: 470.0)
let c6 = CGPoint(x: 190.0, y: 225.0)
let c7 = CGPoint(x: 190.0, y: 50.0)
let c8 = CGPoint(x: 115.0, y: 470.0)
let c9 = CGPoint(x: 115.0, y: 225.0)
let c10 = CGPoint(x: 30.0, y: 470.0)
let c11 = CGPoint(x: 30.0, y: 225.0)

let colorArray = [UIColor.red, UIColor.blue, UIColor.green, UIColor.purple]
var colorIndex = 0

func getVertex(for item: String)->Vertex<String>?  {
    switch item {
    case "start":
        return n1
    case "eggs":
        return eggsCoord
    case "pizza":
        return pizzaCoord
    case "burger", "burgers":
        return burgerCoord
    case "quesadilla":
        return quesadillaCoord
    case "icecream":
        return iceCreamCoord
    case "chicken":
        return chickenCoord
    case "lemon":
        return lemonCoord
    case "carrot":
        return carrotCoord
    case "pasta":
        return pastaCoord
    case "fish":
        return fishCoord
    case "steak":
        return steakCoord
    case "bread":
        return breadCoord
    case "corn":
        return cornCoord
    case "cheese":
        return cheeseCoord
    case "broccoli":
        return broccoliCoord
    default:
        print("default case")
        return nil
    }
}

func getPoint(for vertex: Vertex<String>)->CGPoint?  {
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
