//
//  FoodInfoViewController.swift
//  FoodTrade
//
//  Created by dly on 9/19/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import Firebase

class FoodListTableViewController: UITableViewController {
    
    // Firebase
//    var refFoods: DatabaseReference!
    var foodsList = [FoodModel]()
    var foodCategory = UIButton()
    var foodCatName = String()
    var foodsCategoryList = [FoodModel]()

    
    
    //
    
    
    var category: Category!
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("food cat")
        print(foodCategory)
        if foodCategory.tag == 0 {
            foodCatName = "Appetizer"
        }
        else if foodCategory.tag == 1 {
            foodCatName = "Salad"
        }
        else if foodCategory.tag == 2 {
            foodCatName = "Entree"
        }
        else {
            foodCatName = "Desserts"
        }
        
        
        
        //category stuff

        for  item in foodsList{
            if item.category == foodCatName {
                print(item.name!)
                foodsCategoryList.append(item)
            }
        }
        
        
        
        
        
        
        
        
//        refFoods = Database.database().reference().child("foods")
        
//        fethcAllItems()
//        funkyFood()
        self.title = foodCatName
//        nameLabel.text = "asdfasdfadsf" as FoodListTableViewCell
        
//        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Build rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("rows")
        
//        var counter = Int()
//        for item in foodsList {
//            if item.category == foodCatName {
//                counter += 1
//                }
//        }
        
        print("this is our row counter",foodsCategoryList.count)
        return foodsCategoryList.count
    }
    
    //Build each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("helllo world")
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodListTableViewCell
        
        let foodItem: FoodModel
        print("this is food cat name", foodCatName)

        foodItem = foodsCategoryList[indexPath.row]
        cell.nameLabel.text = foodItem.name
        cell.descLabel.text = foodItem.desc
        cell.chefLabel.text = foodItem.chef
        cell.priceLabel.text = "$"+String(describing: foodItem.price!)
        
        print("name")
        print(foodItem.name)
        return cell
        
        
//            print("viewdidapear.....loadprint")
//            print(foodItem.id, foodItem.name, foodItem.category, foodItem.desc, foodItem.price, foodItem.chef, foodItem.phoneNumber, foodItem.pickUpLocation, foodItem.pickUpLatitude, foodItem.pickUpLongitude)
    
        
        //core data stuff
//        let food = self.category.foods?[indexPath.row] as! Food
//        cell.textLabel?.text = food.name

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! CreateViewController
        cvc.catName = foodCatName
    }
    
//    func fethcAllItems() {
//        print("in the fetch all")
//        
//        
//        refFoods.observe(DataEventType.value, with:{(snapshot) in
//            if snapshot.childrenCount > 0{
//                self.foodsList.removeAll()
//                
//                for foods in snapshot.children.allObjects as![DataSnapshot]{
//                    let foodObject = foods.value as? [String: AnyObject]
//                    
//                    let id = foodObject?["id"]
//                    let name = foodObject?["name"]
//                    let category = foodObject?["category"]
//                    let desc = foodObject?["desc"]
//                    let price = foodObject?["price"]
//                    let chef = foodObject?["chef"]
//                    let phoneNumber = foodObject?["phoneNumber"]
//                    let pickUpLocation = foodObject?["pickUpLocation"]
//                    let pickUpLatitude = foodObject?["pickUpLatitude"]
//                    let pickUpLongitude = foodObject?["pickUpLongitude"]
//                    
//                    let foodItem = FoodModel(id: id as! String?, name: name as! String?, category: category as! String?, desc: desc as! String?, price: price as! Double?, chef: chef as! String?, phoneNumber: phoneNumber as! String?, pickUpLocation: pickUpLocation as! String?, pickUpLatitude: pickUpLatitude as! Double?, pickUpLongitude: pickUpLongitude as! Double?)
//                    
//                    self.foodsList.append(foodItem)
//                }
//            }
//        })
//        print(foodsList.count)
//        tableView.reloadData()
//    }
    
    
    
    
//    func funkyFood() {
//        let foodItem: FoodModel
//        
//        //category stuff
//        var foodsCategory = [FoodModel]()
//        for  item in foodsList{
//            if item.category == "Salad" {
//                print(item.name)
//            }
//        }
//        
//        
//        
//        if foodsList.count > 0 {
//            foodItem = foodsList[foodsList.count-1]
//            print("viewdidapear.....loadprint")
//            print(foodItem.id, foodItem.name, foodItem.category, foodItem.desc, foodItem.price, foodItem.chef, foodItem.phoneNumber, foodItem.pickUpLocation, foodItem.pickUpLatitude, foodItem.pickUpLongitude)
//        }
//    }
    
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addFood" {
//            let addFoodViewController = segue.destination as! AddFoodViewController
//            addFoodViewController.category = category
//        }
//    }
    
    //Listen to when a row is click/selected
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "detailFood", sender: indexPath)
//    }
    
    
    
    
}
