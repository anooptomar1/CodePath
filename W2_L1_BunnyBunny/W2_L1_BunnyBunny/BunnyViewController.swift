//
//  BunnyViewController.swift
//  W2_L1_BunnyBunny
//
//  Created by Daniel Lin on 10/18/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class BunnyViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func didPressSend(_ sender: AnyObject) {
        activityIndicator.startAnimating()
        responseField.text = ""
        
        if inputField.text!.contains("hello"){
            delay(1.4, closure:{
                self.activityIndicator.stopAnimating()
                self.responseField.text = "You're hurting me"
            })

        }
        else if inputField.text == "Bye" {
            responseField.text = "See you later"
        }
        else {
            responseField.text = inputField.text
        }
        
        inputField.text = ""
    }
    var initialOrigin: CGPoint!
    @IBOutlet weak var responseField: UILabel!
    
    @IBAction func didPressJump(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.center.y = self.BunnyImageView.center.y - 20
        }

        UIView.animate(withDuration: 0.3, delay: 0.3, options: [], animations: {
            self.BunnyImageView.center.y = self.BunnyImageView.center.y + 20
            }, completion: nil)
        
        
    }
    @IBAction func didPressRotateLeft(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.transform =
                
            self.BunnyImageView.transform.rotated(by: CGFloat(-20 * M_PI / 180))
        }
        
    }

    @IBAction func didPressRotateRight(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.transform = self.BunnyImageView.transform.rotated(by: CGFloat(20 * M_PI / 180))
        }
        
    }

    @IBAction func didPressShrink(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.transform = self.BunnyImageView.transform.scaledBy(x: 0.8, y: 0.8)
        }
        
    }
    @IBAction func didPressGrow(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.transform = self.BunnyImageView.transform.scaledBy(x: 1.2, y: 1.2)
        }
    }
    @IBOutlet weak var BunnyImageView: UIImageView!
    
    @IBAction func didPressUp(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) { 
            self.BunnyImageView.center.y = self.BunnyImageView.center.y - 20
        }
        
    }

    @IBAction func didPressLeft(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.center.x = self.BunnyImageView.center.x - 20
        }
    }
    @IBAction func didPressRight(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.center.x = self.BunnyImageView.center.x + 20
        }

    }
    
    @IBAction func didPressReset(_ sender: AnyObject) {
        
        BunnyImageView.center = initialOrigin
        BunnyImageView.transform = CGAffineTransform.identity
        
    }
    
    @IBAction func didPressDown(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) {
            self.BunnyImageView.center.y = self.BunnyImageView.center.y + 20
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialOrigin = BunnyImageView.center
        responseField.text = "HI THERE!!!"
        // Do any additional setup after loading the view.
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
