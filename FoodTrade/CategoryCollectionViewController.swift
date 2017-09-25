//
//  CategoryCollectionViewController.swift
//  FoodTrade
//
//  Created by dly on 9/19/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoryCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        let cat = sender as! UIButton
        fltc.foodCategory = cat
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

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


}
