//
//  AddFoodViewController.swift
//  FoodTrade
//
//  Created by Grant Brooks on 9/25/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {

    weak var delegate: AddFoodDelegate?
    var catName = String()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var chefTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var pickUpLocationTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let food = ["id": "",
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
        delegate?.addFood(by: self, newFood: food)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTextField.text = catName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
