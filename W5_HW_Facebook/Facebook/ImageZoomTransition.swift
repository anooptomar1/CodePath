//
//  imageZoonTransition.swift
//  Facebook
//
//  Created by Daniel Lin on 11/14/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageZoomTransition: BaseTransition {

    var originalZoomedImageViewFrame: CGRect!
    var originalFeedImageViewFrame: CGRect!
    let window = UIApplication.shared.keyWindow

    // PRESENT Transition
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        // Variables
        let tabViewController    = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController   = navigationController.topViewController as! NewsFeedViewController
        let toViewController     = toViewController as! ImageViewController
        let zoomedImageView      = toViewController.imageView
        
        originalZoomedImageViewFrame = zoomedImageView!.frame
        originalFeedImageViewFrame   = feedViewController.selectedImageView!.frame
        toViewController.bg.alpha = 0
        zoomedImageView!.frame = CGRect(x: originalFeedImageViewFrame.origin.x, y: originalFeedImageViewFrame.origin.y + 110, width: originalFeedImageViewFrame.width, height: originalFeedImageViewFrame.height)
        //toViewController.backgroundView.alpha = 0

        
        UIView.animate(withDuration: duration, animations: {
            toViewController.bg.alpha = 1
            zoomedImageView!.frame = self.originalZoomedImageViewFrame

        }) { (finished: Bool) -> Void in
            self.finish()   
        }
    }
    
    // DISMISS Transition
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {

        let tabViewController    = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController   = navigationController.topViewController as! NewsFeedViewController
        let zoomedImageViewController = fromViewController as! ImageViewController
        let zoomedImageView           = zoomedImageViewController.imageView
        originalFeedImageViewFrame   = feedViewController.selectedImageView!.frame
        
        
        UIView.animate(withDuration: duration, animations: {
            zoomedImageViewController.bg.alpha = 0
            zoomedImageView!.frame = CGRect(x: self.originalFeedImageViewFrame.origin.x, y: self.originalFeedImageViewFrame.origin.y + 110, width: self.originalFeedImageViewFrame.width, height: self.originalFeedImageViewFrame.height)
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
