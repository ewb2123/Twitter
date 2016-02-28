//
//  User.swift
//  Twitter
//
//  Created by Elijah Bullard on 2/21/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    var tweetCount: Int = 0
    var followingCount: Int = 0
    var followersCount: Int = 0
    var profileBackgroundUrl: NSURL?
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        
        followersCount = (dictionary["followers_count"] as? Int) ?? 0;
        followingCount = (dictionary["friends_count"] as? Int) ?? 0;
        tweetCount = (dictionary["statuses_count"] as? Int) ?? 0;
        
        
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        
        let profileBackgroundUrlString = dictionary["profile_background_image_url_https"] as? String
        if let profileBackgroundUrlString = profileBackgroundUrlString {
            profileBackgroundUrl = NSURL(string: profileBackgroundUrlString)
        }
        
        
        tagline = dictionary["description"] as? String
        
    }
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let userData = defaults.objectForKey("currentUserData") as? NSData
        
            if let userData = userData {
                let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
        _currentUser = User(dictionary: dictionary)
        }
        }
            return _currentUser
        
        }
        set(user) {
            _currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            
            defaults.synchronize()
        }
}

}