//
//  AddPostViewController.swift
//  MyHood
//
//  Created by Felipe Montoya on 10/11/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.layer.cornerRadius = 120
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        

        // Do any additional setup after loading the view.
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        postImage.image = selectedImage
    }

    @IBAction func addImageButtonPressed ( sender: UIButton){
        //code
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostButtonPressed (sender: UIButton) {
        if let title = titleTextField.text, let description = descriptionTextField.text, let image = postImage.image {
            let imagePath = DataService.instance.saveImageAndCreatePath(image: image)
            let post = Post(imagePath: imagePath, title: title, postDescription: description)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed (sender: UIButton){
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
