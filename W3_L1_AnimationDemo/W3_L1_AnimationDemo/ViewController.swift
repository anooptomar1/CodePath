//
//  ViewController.swift
//  W3_L1_AnimationDemo
//
//  Created by Daniel Lin on 10/25/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var pinchGestureRecognizer: UIPinchGestureRecognizer!

    
    var bikerOriginalCenter: CGPoint!
    
    @IBAction func didPinch(_ sender: UIPinchGestureRecognizer) {
    
        let scale = sender.scale
        
        print(scale)
        
        bikerImageView.transform = bikerImageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        
        sender.scale = 1
        //CGAffineTransform(scaleX: scale, y: scale)
        
        
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @IBAction func didRotate(_ sender: AnyObject) {
        
        let rotation = sender.rotationAngle
        
        bikerImageView.transform = CGAffineTransform(rotationAngle: rotation!)
    }
    
    @IBAction func didPanBiker(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began {
            //bikerOriginalCenter = bikerImageView.center
        }
            
        else if sender.state == .changed {
            
            
            let location = sender.location(in: view)
            print("Location: x: \(location.x), y: \(location.y)")
            
            let translation = sender.translation(in:
                view)
            print("Translation: x: \(translation.x), y: \(translation.y)")
            
            bikerImageView.center = CGPoint(x: bikerOriginalCenter.x + translation.x, y: bikerOriginalCenter.y + translation.y)
            
        }
        else if sender.state == .ended {
            bikerOriginalCenter = bikerImageView.center
        }
        
    }
    @IBOutlet weak var bikerImageView: UIImageView!
    
    
    @IBAction func didTapBiker(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Whoa Dude!", message: "Don't tap me!", preferredStyle: .alert)
        let sorryAction = UIAlertAction(title: "Sorry man!", style: .default) { (UIAlertAction) in
            
        }
        alertController.addAction(sorryAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var pigImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bikerOriginalCenter = bikerImageView.center
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var didTapBiker: UITapGestureRecognizer!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapAnimatePigButton(_ sender: AnyObject) {
        
        pigImageView.transform = pigImageView.transform.rotated(by: 45 * CGFloat(M_PI / 180))
        
        let pi = CGFloat(M_PI)
        
        pigImageView.transform = CGAffineTransform(rotationAngle: 45 * CGFloat(M_PI / 180))
        
        
        //        UIView.animate(withDuration: 0.2, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
        //
        //            self.pigImageView.transform = self.pigImageView.transform.translatedBy(x: 0, y: -250)
        //
        //
        //            }) { (Bool) in
        //                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
        //
        //                    self.pigImageView.transform = CGAffineTransform.identity //wipes the board
        //
        //                    }, completion: { (Bool) in
        //                        ///after
        //                })
        //
        //        }
        //
        
        
        //        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
        //            self.pigImageView.center.y += 300
        //            }) { (Bool) in
        //
        //
        //                UIView.animate(withDuration: 1, delay: 0, options: [UIViewAnimationOptions.autoreverse, UIViewAnimationOptions.repeat], animations: {
        //                    self.pigImageView.transform = CGAffineTransform(rotationAngle: 45 * pi)
        //                    }, completion: nil)
        //                
        //        }
        
        
        
    }
    
    
}

