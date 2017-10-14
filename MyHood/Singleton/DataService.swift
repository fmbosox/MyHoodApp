//
//  DataService.swift
//  MyHood
//
//  Created by Felipe Montoya on 10/11/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePost () {
        print("Save about to happen:\(_loadedPosts[0].title)")
        let postData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postData, forKey: "posts")
        UserDefaults.standard.synchronize()
    }
    
    func loadPost () {
        guard let postData = UserDefaults.standard.object(forKey: "posts") as? Data else { return }
        if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postData) as? [Post] {
            _loadedPosts = postsArray
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue:"postLoaded"),object: nil))
        print("Message Sended")
    }
    
    func saveImageAndCreatePath (image: UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(imgPath)
        try? imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
        return imgPath
        
    }
    
    func imageForPath (path: String) -> UIImage?{
        
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
        
    }
    
    func addPost (post: Post){
        _loadedPosts.append(post)
        savePost()
        loadPost()
    }
    
    func documentsPathForFileName(_ name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
}
