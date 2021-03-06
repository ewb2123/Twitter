//
//  Tweet.swift
//  Twitter
//
//  Created by Elijah Bullard on 2/21/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var screenname: NSString?;
    var author: NSString?;
    var authorProfilePicURL: NSURL?;
    
    var text: NSString?;
    var timestamp: NSDate?;
    var retweetCount: Int = 0;
    var favoritesCount: Int = 0;
    var tweetID: String?;
    
    init(dictionary: NSDictionary) {
        
        screenname = dictionary["user"]!["screen_name"] as? String;
        author = dictionary["user"]!["name"] as? String;
        authorProfilePicURL = NSURL(string: dictionary["user"]!["profile_image_url_https"] as! String)!;
        
        text = dictionary["text"] as? String;
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0;
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0;

        tweetID = dictionary["id_str"] as? String;
        
        let timestampString = dictionary["created_at"] as? String;
        
        if let timestampString = timestampString {
            let formatter = NSDateFormatter();
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y";
            timestamp = formatter.dateFromString(timestampString);
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]();
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary);
            
            tweets.append(tweet);
        }
        
        return tweets;
    }
    
}
