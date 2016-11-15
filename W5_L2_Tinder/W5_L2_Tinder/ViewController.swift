//
//  ViewController.swift
//  W5_L2_Tinder
//
//  Created by Daniel Lin on 11/10/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func didTap(_ sender: AnyObject) {
    }
    
    @IBOutlet weak var actual_imageView: UIImageView!
    @IBOutlet weak var imageView: UIView!
    var signFlip: CGFloat!
    var originalPinkViewCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 10
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSwipeView(_ sender: AnyObject) {
        
        let translation = sender.translation(in: view)
        let pinkView = sender.view!
        let location = sender.location(in: pinkView)
        
        if sender.state == .began {
            originalPinkViewCenter = pinkView.center
            if location.y > (pinkView.frame.size.height / 2){
                //tapped bottom half
                signFlip = -1
            } else {
                // tapped top half
                signFlip = 1
            }
        } else if sender.state == .changed {
            pinkView.center.x = originalPinkViewCenter.x + translation.x
            let rotationAngle = (translation.x/4) * CGFloat(M_PI / 180) * signFlip
            pinkView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        } else if sender.state == .ended {
            if translation.x < 100 && translation.x > -100 {
                // return to original button
                UIView.animate(withDuration: 0.3, animations: {
                    pinkView.center = self.originalPinkViewCenter
                    pinkView.transform = CGAffineTransform.identity
                })
                
            } else if translation.x <= -100{
                // Fly off left
                UIView.animate(withDuration: 0.3, animations: {
                    pinkView.center.x = -250
                    pinkView.transform = CGAffineTransform(rotationAngle:-200/4*CGFloat(M_PI/180)*self.signFlip)
                })
                
            } else{
                // fly off right
                UIView.animate(withDuration: 0.3, animations: {
                    pinkView.center.x = self.view.frame.size.width + 250
                    pinkView.transform = CGAffineTransform(rotationAngle:200/4*CGFloat(M_PI/180)*self.signFlip)
                    
                })
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! detailViewController
        
        destinationViewController.image = self.actual_imageView.image
    }
    
    class detailViewController : UIViewController {
        var image: UIImage!
    }

}

