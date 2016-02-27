//
//  TweetDetailViewController.swift
//  Twitter
//
//  Created by Elijah Bullard on 2/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    var tweet: Tweet!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var authorProfilePic: UIImageView!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authorLabel.text = tweet.author as? String
        screennameLabel.text = tweet.screenname as? String
        tweetContentLabel.text = tweet.text as? String
        retweetsLabel.text = String(tweet.retweetCount)
        favoritesLabel.text = String(tweet.favoritesCount)
        timestamp.text = String(tweet.timestamp!)
        authorProfilePic.setImageWithURL(tweet.authorProfilePicURL!)
        authorProfilePic.layer.cornerRadius = 4
        
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func retweetButton(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(tweet.tweetID!, success: { (Tweet) -> () in
            print("retweeted")
            self.retweetsLabel.text = String(self.tweet.retweetCount + 1)
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
    }

    @IBAction func favoriteButton(sender: AnyObject) {
        TwitterClient.sharedInstance.favorite(tweet.tweetID!, success: { (Tweet) -> () in
            print("favorited")
            self.favoritesLabel.text = String(self.tweet.favoritesCount + 1)
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
    }
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let composeViewController = segue.destinationViewController as! ComposeViewController
        composeViewController.tweet = self.tweet
    }
}
