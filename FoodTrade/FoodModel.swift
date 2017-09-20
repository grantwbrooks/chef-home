//
//  FoodModel.swift
//  FoodTrade
//
//  Created by Grant Brooks on 9/20/17.
//  Copyright © 2017 dly. All rights reserved.
//

class FoodModel{
    
    var id: String?
    var name: String?
    var category: String?
    var desc: String?
    var price:Double?
    var chef: String?
    var phoneNumber: String?
    var pickUpLocation: String?
    var pickUpLatitude: Double?
    var pickUpLongitude: Double?
    
    init(id: String?, name: String?, category: String?, desc: String?, price: Double?, chef: String?, phoneNumber: String?, pickUpLocation: String?, pickUpLatitude: Double?, pickUpLongitude: Double?) {
        self.id = id
        self.name = name
        self.category = category
        self.desc = desc
        self.price = price
        self.chef = chef
        self.phoneNumber = phoneNumber
        self.pickUpLocation = pickUpLocation
        self.pickUpLatitude = pickUpLatitude
        self.pickUpLongitude = pickUpLongitude
    }
}
