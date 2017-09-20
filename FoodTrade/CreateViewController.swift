//
//  CreateViewController.swift
//  FoodTrade
//
//  Created by dly on 9/19/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class CreateViewController: UIViewController {
    
    var refFoods: DatabaseReference!
    var foodsList = [FoodModel]()
    
    
    var food = [Food]()
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var foodPicture: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var chefTextField: UITextField!
    @IBOutlet weak var orderByTextField: UITextField!
    @IBOutlet weak var readyByTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var pickUpLocationTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        addFood()
        //Add Item
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "Food", into: managedObjectContext) as! Food
        newItem.name = nameTextField.text
        newItem.category = categoryTextField.text
        newItem.desc = descriptionTextField.text
        newItem.price = Double(priceTextField.text!)!
        newItem.chef = chefTextField.text
//        newItem.orderBy = orderByTextField.text
//        newItem.readyBy = readyByTextField.text
        newItem.phoneNumber = phoneTextField.text
        newItem.pickUpLocation = pickUpLocationTextField.text
        newItem.pickUpLatitude = 0.0
        newItem.pickUpLongitude = 0.0
        
        food.append(newItem)
    
        //Save the ScratchPad
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        
        funkyFood()
        _ = navigationController?.popViewController(animated: true)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refFoods = Database.database().reference().child("foods")
        
        refFoods.observe(DataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount > 0{
                self.foodsList.removeAll()
                
                for foods in snapshot.children.allObjects as![DataSnapshot]{
                    let foodObject = foods.value as? [String: AnyObject]
                    
                    let id = foodObject?["id"]
                    let name = foodObject?["name"]
                    let category = foodObject?["category"]
                    let desc = foodObject?["desc"]
                    let price = foodObject?["price"]
                    let chef = foodObject?["chef"]
                    let phoneNumber = foodObject?["phoneNumber"]
                    let pickUpLocation = foodObject?["pickUpLocation"]
                    let pickUpLatitude = foodObject?["pickUpLatitude"]
                    let pickUpLongitude = foodObject?["pickUpLongitude"]
                    
                    let foodItem = FoodModel(id: id as! String?, name: name as! String?, category: category as! String?, desc: desc as! String?, price: price as! Double?, chef: chef as! String?, phoneNumber: phoneNumber as! String?, pickUpLocation: pickUpLocation as! String?, pickUpLatitude: pickUpLatitude as! Double?, pickUpLongitude: pickUpLongitude as! Double?)
                    
                    self.foodsList.append(foodItem)
                }
            }
        })
        
        // Do any additional setup after loading the view.
    }
    
    
    func funkyFood() {
        let foodItem: FoodModel
        if foodsList.count > 0 {
            foodItem = foodsList[foodsList.count-1]
            
            print(foodItem.id, foodItem.name, foodItem.category, foodItem.desc, foodItem.price, foodItem.chef, foodItem.phoneNumber, foodItem.pickUpLocation, foodItem.pickUpLatitude, foodItem.pickUpLongitude)
        }
    }
    
    
    
    func addFood() {
        let key = refFoods.childByAutoId().key
        
        let food = ["id": key,
                    "name": nameTextField.text! as String,
                    "category": categoryTextField.text! as String,
                    "desc": descriptionTextField.text! as String,
                    "price": Double(priceTextField.text!)! as Double,
                    "chef": chefTextField.text! as String,
                    "phoneNumber": phoneTextField.text! as String,
                    "pickUpLocation": pickUpLocationTextField.text! as String,
                    "pickUpLatitude": 0.0 as Double,
                    "pickUpLongitude": 0.0 as Double
        ] as [String : Any]
        
        refFoods.child(key).setValue(food)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


