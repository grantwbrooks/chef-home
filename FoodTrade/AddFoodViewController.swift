//
//  AddFoodViewController.swift
//  FoodTrade
//
//  Created by Grant Brooks on 9/25/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit


class AddFoodViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    weak var delegate: AddFoodDelegate?
    var catName = String()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var chefTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var pickUpLocationTextField: UITextField!
    
    
    @IBOutlet weak var foodImage: UIImageView!
    var foodImg: UIImage?
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let food = ["id": "",
                    "name": nameTextField.text! as String,
                    "foodImageURL": foodImage.image!,
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
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        
        if let selectedImage = selectedImageFromPicker {
            foodImage.image = selectedImage
            foodImg = selectedImage
        }
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTextField.text = catName
        foodImage.image = #imageLiteral(resourceName: "salad")

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
