//
//  DetailViewController.swift
//  MyHood
//
//  Created by Felipe Montoya on 10/13/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var postToDisplay = Post(imagePath: "", title: "", postDescription: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleLabel.text = postToDisplay.title
        detailDescriptionLabel.text = postToDisplay.postDescription
        detailImage.image = DataService.instance.imageForPath(path: postToDisplay.imagePath)
        
    }
    
    
    

    
    @IBAction func backButtonPressed (sender: UIButton){
        dismiss(animated: true, completion: nil)
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
