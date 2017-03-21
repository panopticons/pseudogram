//
//  MainViewController.swift
//  pseudogram
//
//  Created by fer on 3/20/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var postTable: UITableView!
  var data: [PFObject]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    postTable.delegate = self
    postTable.dataSource = self
    
    let query = PFQuery(className: "Post")
    query.order(byDescending: "createdAt")
    query.includeKey("author")
    query.includeKey("caption")
    query.includeKey("media")
    query.limit = 20
    
    // fetch data asynchronously
    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
      
      if let posts = posts {
        self.data = posts
      } else {
        print("NIL")
      }
    }
    postTable.reloadData()
    
    // Do any additional setup after loading the view.
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func logOut(_ sender: Any) {
    PFUser.logOut()
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if data != nil {
      return data.count
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "postViewCell", for: indexPath as IndexPath) as! postViewCell
    
    cell.post = data[indexPath.row]
    
    return cell
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
