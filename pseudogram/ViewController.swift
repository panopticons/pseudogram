//
//  ViewController.swift
//  pseudogram
//
//  Created by fer on 3/16/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

  @IBOutlet weak var userBox: UITextField!
  @IBOutlet weak var passwordBox: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    view.addGestureRecognizer(tap)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func signUp(_ sender: Any) {
    let newUser = PFUser()
    newUser.username = userBox.text
    newUser.password = passwordBox.text
    
    newUser.signUpInBackground() {
      (succeeded: Bool?, error: Error?) -> Void in
      if !newUser.isNew {
        //self.present(self.alertController2, animated: true)
        print("false")
      }
      else {
        self.performSegue(withIdentifier: "logIn", sender: nil)
      }
    }
  }

  @IBAction func logIn(_ sender: Any) {

    PFUser.logInWithUsername(inBackground: userBox.text!, password: passwordBox.text!){ (user: PFUser?, error: Error?) in
      if user != nil
      {
        self.performSegue(withIdentifier: "logIn", sender: nil)
      }
      else {
        //self.present(self.alertController1, animated: true)
        self.userBox.text = ""
        self.passwordBox.text = ""
        }
      }
    }
  
  func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
}



















