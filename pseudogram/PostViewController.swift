//
//  PostViewController.swift
//  pseudogram
//
//  Created by fer on 3/20/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit
import Parse

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

  func resize(image: UIImage, newSize: CGSize) -> UIImage {
    let resizeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
    resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
    resizeImageView.image = image
    
    UIGraphicsBeginImageContext(resizeImageView.frame.size)
    resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
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
    
    if (postCap.text! == "")
    {
      print("ERROR")
    }
    else
    {
      /*let scaledImage = self.resize(image: self.postImage.image!, newSize: CGSize(width: 750, height: 750))
      let imageData = UIImageJPEGRepresentation(scaledImage, 0)
      let imageFile = PFFile(name:"image.jpg", data:imageData!)
      let picture = PFObject(className: "Picture")
      picture["image"] = imageFile*/
      
      
      let post = PFObject(className: "Post")
      //post["media"] = picture
      post["author"] = PFUser.current()
      post["caption"] = postCap.text!
      
      self.dismiss(animated: true, completion: nil)
  }
}

  func getPFFileFromImage(image: UIImage?) -> PFFile? {
    // check if image is not nil
    if let image = image {
      // get image data and check if that is not nil
      if let imageData = UIImagePNGRepresentation(image) {
        return PFFile(name: "image.png", data: imageData)
      }
    }
    return nil
  }
  
  @nonobjc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    // Get the image captured by the UIImagePickerController
    let pic = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    postImage.image = pic
    self.dismiss(animated: true, completion: nil)
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
