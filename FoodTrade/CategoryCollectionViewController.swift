//
//  CategoryCollectionViewController.swift
//  FoodTrade
//
//  Created by dly on 9/19/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class CategoryCollectionViewController: UICollectionViewController {
    
    var refFoods: DatabaseReference!
    var foodsList = [FoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in here...view id load...")
        
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


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        funkyFood()
    }
    
    func funkyFood() {
        let foodItem: FoodModel
        
        //category stuff
        var foodsCategory = [FoodModel]()
        for  item in foodsList{
            if item.category == "Salad" {
                print(item.name)
            }
        }
        
        
        
        if foodsList.count > 0 {
            foodItem = foodsList[foodsList.count-1]
            print("viewdidapear.....loadprint")
            print(foodItem.id, foodItem.name, foodItem.category, foodItem.desc, foodItem.price, foodItem.chef, foodItem.phoneNumber, foodItem.pickUpLocation, foodItem.pickUpLatitude, foodItem.pickUpLongitude)
        }
    }
    

    //  Stuff above will get removed
    
    
    @IBAction func appetizerPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showFoodList", sender: sender)
    }
    
    @IBAction func saladPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showFoodList", sender: sender)
    }
    
    @IBAction func entreePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showFoodList", sender: sender)
    }
    
    @IBAction func dessertPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showFoodList", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fltc = segue.destination as! FoodListTableViewController
        fltc.foodsList = foodsList
        let cat = sender as! UIButton
        fltc.foodCategory = cat
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    //Conform to CreateViewControllerDelegate
//    func saveButtonPressed(by controller: UIViewController) {
//        //        dismiss(animated: true, completion: nil)
//        _ = navigationController?.popViewController(animated: true)
//    }
//    
//    //Segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let createViewController = segue.destination as! CreateViewController
//        createViewController.delegate = self
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
