//
//  TwitterClient.swift
//  Twitter
//
//  Created by Elijah Bullard on 2/16/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "RL26GJec79uLY7gOUmiwtaIIV"
let twitterConsumerSecret = "9NElslrLHLluUBMo6MBRgXAWErOQx6vnkN7XvIcx3ZFrfNoF5c"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance =  TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }
}
