//
//  CanvasViewController.swift
//  W3_L2_Canvas
//
//  Created by Daniel Lin on 10/27/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var arrow: UIImageView!
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var faceOriginalCenter: CGPoint!
    var panGestureRecognizer: UIPanGestureRecognizer!
    var pinchGestureRecognizer: UIPinchGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayDownOffset = 200
        trayUp = tray.center
        trayDown = CGPoint(x: tray.center.x ,y: tray.center.y + trayDownOffset)

        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(sender:)))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tray: UIView!

    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += tray.frame.origin.y
            faceOriginalCenter = newlyCreatedFace.center
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 1.3, y: 1.3)
                }, completion: { (Bool) in
            })
            
        }
        else if sender.state == .changed {
            newlyCreatedFace.center = CGPoint(x: faceOriginalCenter.x + translation.x , y: faceOriginalCenter.y + translation.y)
        }
        else if sender.state == .ended {
            
            // Setup
            newlyCreatedFace.isUserInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            newlyCreatedFace.addGestureRecognizer(pinchGestureRecognizer)
            
            // Animate
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 0.7, y: 0.7)
                }, completion: { (Bool) in
            })
        }
        
    }
    
    @IBAction func didPanTray(_ sender: AnyObject) {
        
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began{
            trayOriginalCenter = tray.center
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                
                self.tray.center = self.trayDown
                self.arrow.transform = self.arrow.transform.rotated(by: 180)
                }, completion: { (Bool) in
                    
            })
        }
        else if sender.state == .changed {
            tray.center = CGPoint(x: trayOriginalCenter.x , y: trayOriginalCenter.y + translation.y)
        }
        else if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            if velocity.y > 0 {

            }
            else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                    
                    self.tray.center = self.trayUp
                    self.arrow.transform = self.arrow.transform.rotated(by: -180)
                    }, completion: { (Bool) in
                        
                })
            }
        }
    }
    
    
    func didPan(sender: UIPanGestureRecognizer) {
        _ = sender.location(in: view)
        _ = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            newlyCreatedFace = sender.view as! UIImageView
            faceOriginalCenter = newlyCreatedFace.center
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                
                self.tray.center = self.trayDown
                self.arrow.transform = self.arrow.transform.rotated(by: 180)
                }, completion: { (Bool) in
                    
            })
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 1.3, y: 1.3)
                }, completion: { (Bool) in
            })
            print("Gesture began")
        } else if sender.state == .changed {
            newlyCreatedFace.center = CGPoint(x: faceOriginalCenter.x + translation.x, y: faceOriginalCenter.y + translation.y)
            print("Gesture is changing")
        } else if sender.state == .ended {
            print("Gesture ended")
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                
                self.tray.center = self.trayUp
                self.arrow.transform = self.arrow.transform.rotated(by: -180)
                }, completion: { (Bool) in
                    
            })
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 0.7, y: 0.7)
                }, completion: { (Bool) in
            })
        }
    }
    
    func didPinch(sender: UIPinchGestureRecognizer) {
        // get the scale value from the pinch gesture recognizer
        let scale = sender.scale
        
        
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
