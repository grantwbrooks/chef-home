//
//  FoodInfoViewController.swift
//  FoodTrade
//
//  Created by dly on 9/19/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FoodListTableViewController: UITableViewController, AddFoodDelegate {
    
    // Firebase
    var refFoods: DatabaseReference!
    var handle: DatabaseHandle?
    
    var foodsList = [FoodModel]()
    var foodCategory = UIButton()
    var foodCatName = String()
    var foodsCategoryList = [FoodModel]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        refFoods = Database.database().reference()
        
//                refFoods.observe(DataEventType.value, with:{(snapshot) in
        handle = refFoods.child("foods").observe(DataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount > 0{
                print("before remove", self.foodsList)
                self.foodsList.removeAll()
                self.foodsCategoryList.removeAll()
                print("after remove", self.foodsList)
                
                for foods in snapshot.children.allObjects as![DataSnapshot]{
                    let foodObject = foods.value as? [String: AnyObject]
                    
                    let id = foodObject?["id"]
                    let name = foodObject?["name"]
                    let foodImageURL = foodObject?["foodImageURL"]
                    let category = foodObject?["category"]
                    let desc = foodObject?["desc"]
                    let price = foodObject?["price"]
                    let chef = foodObject?["chef"]
                    let phoneNumber = foodObject?["phoneNumber"]
                    let pickUpLocation = foodObject?["pickUpLocation"]
                    let pickUpLatitude = foodObject?["pickUpLatitude"]
                    let pickUpLongitude = foodObject?["pickUpLongitude"]
                    
                    let foodItem = FoodModel(id: id as! String?, name: name as! String?, foodImageURL: foodImageURL as! String?, category: category as! String?, desc: desc as! String?, price: price as! Double?, chef: chef as! String?, phoneNumber: phoneNumber as! String?, pickUpLocation: pickUpLocation as! String?, pickUpLatitude: pickUpLatitude as! Double?, pickUpLongitude: pickUpLongitude as! Double?)
                    
                    self.foodsList.append(foodItem)
                }
                print("adding new ones")
                self.buildFoodCatList()
            }
        })
// HANDLER ENDS
        
        //category stuff
        
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
        self.title = foodCatName
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Build rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsCategoryList.count
    }
    
    //Build each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodListTableViewCell
        
        let foodItem: FoodModel

        foodItem = foodsCategoryList[indexPath.row]
        cell.nameLabel.text = foodItem.name
        cell.descLabel.text = foodItem.desc
        cell.chefLabel.text = foodItem.chef
        cell.priceLabel.text = "$"+String(describing: foodItem.price!)
        
        if let profileImageUrl = foodItem.foodImageURL {
            cell.imageLabel.loadImageUsingCacheWithUrlString(profileImageUrl)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! AddFoodViewController
        cvc.catName = foodCatName
        cvc.delegate = self
    }


    var imageURL: String?
    
    func addFood(by controller: UIViewController, newFood: [String : Any]) {
        navigationController?.popViewController(animated: true)
        
        print(newFood["foodImageURL"])

        let imageName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("food_images").child("\(imageName).png")
        
        let foodUpload = newFood["foodImageURL"]! as! UIImage
        
        if let uploadData = UIImagePNGRepresentation(foodUpload) {
            
            
            storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                print("metaprint",metadata!)
                if let error = error {
                    print(error)
                    return
                }
                
                if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                    print(profileImageUrl)
                    print(type(of: profileImageUrl))
                    self.imageURL = profileImageUrl
                    let key = self.refFoods.child("foods").childByAutoId().key
                    var newItem = newFood
                    newItem["id"] = key
                    newItem["foodImageURL"] = profileImageUrl
                    print("this is the good thinking", self.imageURL!)
                    
                    self.refFoods.child("foods").child(key).setValue(newItem)
                    
                }
                
            })
        }
        
        
        
        
        

    }
    
    func buildFoodCatList() {
        for item in foodsList{
            if item.category == foodCatName {
                foodsCategoryList.append(item)
            }
        }
        tableView.reloadData()
    }
}
