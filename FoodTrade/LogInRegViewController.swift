//
//  LogInRegViewController.swift
//  FoodTrade
//
//  Created by Grant Brooks on 9/26/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase


class LogInRegViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var fullnameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    
    
    @IBAction func logRegSegmentPressed(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 1 {
            actionButton.setTitle("Register", for: .normal)
            fullnameText.isHidden = false
            addressText.isHidden = false
            phoneText.isHidden = false
        }
        else {
            actionButton.setTitle("Login", for: .normal)
            fullnameText.isHidden = true
            addressText.isHidden = true
            phoneText.isHidden = true
        }
    }
    
    @IBOutlet weak var actionButton: UIButton!
    

    @IBAction func action(_ sender: UIButton) {
        
        if emailText.text != "" && passwordText.text != "" {
            if segmentControl.selectedSegmentIndex == 0 {
                //login user
                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil {
                        // sign in successful
                        self.performSegue(withIdentifier: "loggedInSegue", sender: self)
                    }
                    else {
                        if let myError = error?.localizedDescription {
                            print(myError)
                        }
                        else {
                            print("ERROR")
                        }
                    }
                })
            }
            else {
                //sign up user
                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil {
                        self.performSegue(withIdentifier: "loggedInSegue", sender: self)
                    }
                    else {
                        if let myError = error?.localizedDescription {
                            print(myError)
                        }
                        else {
                            print("ERROR")
                        }
                    }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.selectedSegmentIndex = 1
        actionButton.setTitle("Register", for: .normal)

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
