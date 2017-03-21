//
//  PostViewController.swift
//  pseudogram
//
//  Created by fer on 3/20/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var postImage: UIImageView!
  @IBOutlet weak var photoLib: UIButton!
  @IBOutlet weak var cameraTake: UIButton!
  @IBOutlet weak var postCap: UITextView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PostViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func cancel(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  @IBAction func takePic(_ sender: Any) {
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    vc.sourceType = UIImagePickerControllerSourceType.camera
    self.present(vc, animated: true, completion: nil)
  }
  
  @IBAction func photoPick(_ sender: Any) {
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
    self.present(vc, animated: true, completion: nil)
  }
  
  @IBAction func makePost(_ sender: Any) {
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    // Do something with the images (based on your use case)
    postImage.image = originalImage
    
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
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
