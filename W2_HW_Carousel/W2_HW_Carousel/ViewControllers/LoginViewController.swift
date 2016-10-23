//
//  LoginViewController.swift
//  W2_HW_Carousel
//
//  Created by Daniel Lin on 10/22/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var scrollField: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
    let failLogin_alertController = UIAlertController(
        title: "Oops! Invalid Email or Password", message: "Please enter a valid Email and Password", preferredStyle: .alert)
    // create an OK action
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        // handle response here.
    }
    
    
    @IBAction func buttonDidPress(_ sender: AnyObject) {
        
        if emailField.text!.isEmpty
        {
            alertController.title = "Email Required"
            alertController.message = "Please enter your email address"
            present(alertController, animated: true)
        }
        else if passwordField.text!.isEmpty
        {
            alertController.title = "Password Required"
            alertController.message = "Please enter your password"
            present(alertController, animated: true)
        }
        else
        {
            //Checking Login & PW
            activityIndicator.startAnimating()
            run(after: 2, closure: {
                
                //stop activity indicator
                self.activityIndicator.stopAnimating()
                
                //SUCCESSFUL LOGIN
                if self.emailField.text == "dlin" && self.passwordField.text == "pw"
                {
                    self.performSegue(withIdentifier: "transitionToTutorial", sender: nil)
                }
                    
                //FAIL LOGIN
                else
                {
                    self.present(self.failLogin_alertController, animated: true)
                }
            })
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = buttonsView.frame.origin.y
        buttonOffset = -110
        
        alertController.addAction(OKAction)
        failLogin_alertController.addAction(OKAction)
        
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
