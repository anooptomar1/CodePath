//
//  LoginViewController.swift
//  W2_HW_Carousel
//
//  Created by Daniel Lin on 10/22/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var scrollField: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = buttonsView.frame.origin.y
        buttonOffset = -110
        
        
        scrollView.delegate = self
        // Set the scroll view content size
        scrollView.contentSize = scrollField.frame.size
        // Set the content insets
        scrollView.contentInset.bottom = 120
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in

            self.buttonsView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            // Scroll the scrollview up
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
        }
        
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
