//
//  postViewCell.swift
//  pseudogram
//
//  Created by fer on 3/20/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class postViewCell: UITableViewCell {

  @IBOutlet weak var postPic: UIImageView!
  
  @IBOutlet weak var postCaption: UILabel!
  
  @IBOutlet weak var postAuth: UILabel!
  
  var post: PFObject! {
    didSet {
      let author = post["author"] as! PFUser?
      let picture = post["media"] as! PFObject
      let imageData = picture["image"] as? PFFile
      self.postAuth.text = author?.username
      self.postCaption.text = post["caption"] as! String?
      imageData!.getDataInBackground { (imageInfo: Data?, error: Error?) in
        if(error == nil) {
          let picture = UIImage(data: imageInfo!)
          self.postPic.image = picture
        }
      }
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
