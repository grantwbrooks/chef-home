//
//  AddFoodDelegate.swift
//  FoodTrade
//
//  Created by Grant Brooks on 9/25/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit

protocol AddFoodDelegate: class {
    func addFood (by controller: UIViewController, newFood: [String : Any])
}
