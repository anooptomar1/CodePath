//
//  ViewController.swift
//  W2_L2_Facebook
//
//  Created by Daniel Lin on 10/20/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    var originalButtonCenter: CGPoint!
    var offsetButtonCenter: CGPoint!
    @IBAction func didTapMainView(_ sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalButtonCenter = loginButton.center
        offsetButtonCenter = CGPoint(x:originalButtonCenter.x, y: originalButtonCenter.y - 150)
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) {
        (Notification) in
            //do something when the keyboard shows
            print("keyboard has shown")
            self.loginButton.center = self.offsetButtonCenter
        }
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (Notification) in
            self.loginButton.center = self.originalButtonCenter
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

