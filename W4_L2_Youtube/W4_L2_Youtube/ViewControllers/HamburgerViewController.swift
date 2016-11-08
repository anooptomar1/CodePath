//
//  HamburgerViewController.swift
//  W4_L2_Youtube
//
//  Created by Daniel Lin on 11/3/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    var menuOriginalCenter: CGPoint!
    var feedOriginalCenter: CGPoint!
    
    var startingCenter: CGPoint!
    
    var x_openMenu = 321
    var x_closeMenu = 0
    
    
    @IBAction func viewDidPan(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began:
            startingCenter = feedView.center
        case .changed:
            if ((feedView.frame.origin.x + translation.x) >= 0){
                feedView.center = CGPoint(x: startingCenter.x + translation.x, y: startingCenter.y)
            }
            else{
                feedView.frame.origin.x = 0
            }
        case .ended:
            let velocity = sender.velocity(in: view)

            if (velocity.x > 300) || (feedView.frame.origin.x > CGFloat(x_openMenu - 100)){
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.7, initialSpringVelocity: 0.3 + (velocity.x/100), options: [], animations: {
                        self.feedView.frame.origin.x = CGFloat(self.x_openMenu)
                    }, completion: { (Bool) in
                })
            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.7, initialSpringVelocity: 0.3 + (velocity.x/100), options: [], animations: {
                    self.feedView.frame.origin.x = CGFloat(self.x_closeMenu)
                    }, completion: { (Bool) in
                })
            }
        default:
            print("hi")
        }

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        
        addChildViewController(menuViewController)
        menuView.addSubview(menuViewController.view)
        menuViewController.didMove(toParentViewController: self)
        
        addChildViewController(feedViewController)
        feedView.addSubview(feedViewController.view)
        feedViewController.didMove(toParentViewController: self)
       
        menuOriginalCenter = menuView.center
        feedOriginalCenter = feedView.center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
