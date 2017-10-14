//
//  Post.swift
//  MyHood
//
//  Created by Felipe Montoya on 10/10/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import Foundation


class Post: NSObject, NSCoding {
    
    fileprivate var _imagePath: String
    fileprivate var _title: String
    fileprivate var _postDescription: String
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDescription: String {
        return _postDescription
    }
    
    init(imagePath: String, title: String, postDescription:String){
        self._imagePath = imagePath
        self._title = title
        self._postDescription = postDescription
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String, let title = aDecoder.decodeObject(forKey: "title") as? String, let postDescription = aDecoder.decodeObject(forKey: "description") as? String   else {
            return nil
        }
        self.init(imagePath: imagePath, title: title, postDescription: postDescription)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._postDescription, forKey: "description")
        aCoder.encode(self._title, forKey: "title")
    }
    


    
}
