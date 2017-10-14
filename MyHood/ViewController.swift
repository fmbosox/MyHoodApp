//
//  ViewController.swift
//  MyHood
//
//  Created by Felipe Montoya on 10/10/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPost()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postLoaded"), object: nil)
        
        
    }
    
   @objc func onPostsLoaded (_ notif:AnyObject){
        tableView.reloadData()
    print("Reload data successful")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell{
            cell.configureCell(with: post)
            return cell
        }
        return PostCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }

    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        //detailViewSegue
        if segue.identifier == "detailViewSegue" {
            let destination = segue.destination as! DetailViewController
            guard let row = tableView.indexPathForSelectedRow?.row else { return}
            print(row)
            destination.postToDisplay = DataService.instance.loadedPosts[row]
        }
     }
 


}

