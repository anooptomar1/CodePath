//
//  MainViewController.swift
//  W3_HW_Mailbox
//
//  Created by Daniel Lin on 10/30/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // Components
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var messageBackgroundView: UIView!
    
    // Variables
    var messageOriginalPosition: CGPoint!
    var rightIconOriginalPosition: CGPoint!
    var leftIconOriginalPosition: CGPoint!
    
    // Swipe Icons
    @IBOutlet weak var rightIcon_later: UIImageView!
    @IBOutlet weak var rightIcon_list: UIImageView!
    @IBOutlet weak var rightIcon: UIView!
    @IBOutlet weak var leftIcon: UIView!
    @IBOutlet weak var leftIcon_archive: UIImageView!
    @IBOutlet weak var leftIcon_delete: UIImageView!
    @IBOutlet weak var swipeIcons: UIView!
    
    // Modals
    @IBOutlet weak var swipeModal: UIView!
    @IBOutlet weak var swipeModal_list: UIImageView!
    @IBOutlet weak var swipeModal_snooze: UIImageView!
    @IBAction func swipeModal_didDismiss(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3) { 
            self.swipeModal.alpha = 0
        }
        delay(0.3) { self.scrollUp() }
    }
    
    // Helper Function
    func scrollUp (){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options: [], animations: {
        self.scrollView.center.y -= self.messageView.frame.height + 10
        }, completion: { (Bool) in
        })
        resetPrototyper_layer.alpha = 1
    }
    
    // Prototype Control
    @IBOutlet weak var resetPrototyper_layer: UIButton!
    @IBAction func resetPrototype(_ sender: AnyObject) {
        if resetPrototyper_layer.alpha == 1{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options: [], animations: {
                self.scrollView.center.y += self.messageView.frame.height + 10
                }, completion: { (Bool) in
            })
            messageView.center = messageOriginalPosition
            resetPrototyper_layer.alpha = 0
        }
    }
    
    
    // FUNCTIONS
    @IBAction func messageDidPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var swipeModalOpacity = 0

        if sender.state == .began {
            leftIcon.alpha = 1
            leftIcon_delete.alpha = 0
            leftIcon_archive.alpha = 1
            rightIcon.alpha = 1
            rightIcon_list.alpha = 0
            rightIcon_later.alpha = 1
            swipeIcons.alpha = 1
            swipeIcons.center = messageOriginalPosition
        }
        
        if sender.state == .changed {
            print(translation)
            self.messageView.center = CGPoint(x: messageOriginalPosition.x + translation.x, y: messageOriginalPosition.y)
            
            // DRAG LEFT
            if translation.x < -260 {
            // REMINDER
                
                // Brown Background
                self.messageBackgroundView.backgroundColor = UIColor(red:0.85, green:0.65, blue:0.46, alpha:1.00)
                // Move Icon
                rightIcon.center = CGPoint(x: rightIconOriginalPosition.x + translation.x + 60, y: rightIconOriginalPosition.y)
                // Switch Icon: Delete
                rightIcon_list.alpha = 1
                rightIcon_later.alpha = 0
            }
            else if translation.x < -60 {
            // SNOOZE
                
                // Yellow Background
                self.messageBackgroundView.backgroundColor = UIColor(red:0.98, green:0.82, blue:0.20, alpha:1.00)
                // Move Icon
                rightIcon.center = CGPoint(x: rightIconOriginalPosition.x + translation.x + 60, y: rightIconOriginalPosition.y)
                // Switch Icon: Snooze
                rightIcon_list.alpha = 0
                rightIcon_later.alpha = 1
            }

                
            // DRAG RIGHT
            else if translation.x > 260 {
            // DELETE
                
                // Red Background
                self.messageBackgroundView.backgroundColor = UIColor(red:0.93, green:0.33, blue:0.20, alpha:1.00)
                // Move Icon
                leftIcon.center = CGPoint(x: leftIconOriginalPosition.x + translation.x - 60, y: leftIconOriginalPosition.y)
                // Switch Icon: Delete
                leftIcon_delete.alpha = 1
                leftIcon_archive.alpha = 0
            }
            else if translation.x > 60 {
                // ARCHIVE
                
                // Green Background
                self.messageBackgroundView.backgroundColor = UIColor(red:0.44, green:0.85, blue:0.39, alpha:1.00)
                // Move Icon
                leftIcon.center = CGPoint(x: leftIconOriginalPosition.x + translation.x - 60, y: leftIconOriginalPosition.y)
                // Switch Icon: Archive
                leftIcon_delete.alpha = 0
                leftIcon_archive.alpha = 1
            }

            // OTHERWISE
            else{
                swipeIcons.alpha = convertValue(inputValue: abs(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
                
                self.messageBackgroundView.backgroundColor = UIColor.gray
            }
            
        }
        
        if sender.state == .ended{
            let offScreenRight = CGPoint(x: messageView.frame.width * 2, y: messageView.center.y)
            let offScreenLeft = CGPoint(x: messageView.frame.width * -1, y: messageView.center.y)
            var animateTo : CGPoint!
            
            // RELEASE LEFT
            if translation.x < -260 {
            // REMINDER
                animateTo = offScreenLeft
                leftIcon.alpha = 0
                swipeModalOpacity = 1
                swipeModal_list.alpha = 1
                swipeModal_snooze.alpha = 0


            }
            else if translation.x < -60 {
            // SNOOZE
                animateTo = offScreenLeft
                leftIcon.alpha = 0
                swipeModalOpacity = 1
                swipeModal_list.alpha = 0
                swipeModal_snooze.alpha = 1

            }
                
                
            // RELEASE RIGHT
            else if translation.x > 260 {
            // DELETE
                animateTo = offScreenRight
                rightIcon.alpha = 0
                
                //scroll up
                delay(0.4, closure: {self.scrollUp()})

            }
            else if translation.x > 60 {
            // ARCHIVE
                animateTo = offScreenRight
                rightIcon.alpha = 0
                
                //scroll
                delay(0.4, closure: {self.scrollUp()})

            }
                
            // NO ACTION
            else{
                animateTo = messageOriginalPosition
            }
            
            UIView.animate(withDuration: 0.4) {
                self.swipeModal.alpha = CGFloat(swipeModalOpacity)
            }
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
                    self.messageView.center = animateTo
                    self.swipeIcons.center = animateTo
                }, completion: { (Bool) in
            })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: 1202)
        print(messageView.center)
        messageOriginalPosition = messageView.center
        rightIconOriginalPosition = rightIcon.center
        leftIconOriginalPosition = leftIcon.center
        swipeModal.alpha = 0
        resetPrototyper_layer.alpha = 0
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
