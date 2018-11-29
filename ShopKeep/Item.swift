//
//  Item.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/25/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

class Item {
    var name: String
    var brands: [Brand]
    var image: UIImage

    public init(name: String, brands: [Brand], image: UIImage) {
        self.name = name
        self.brands = brands
        self.image = image
    }
}

struct Brand {
    var name: String
    var price: String
    var discount: String?
}
