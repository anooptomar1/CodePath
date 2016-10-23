//
//  loginViewController.swift
//  W2_L1_BunnyBunny
//
//  Created by Daniel Lin on 10/18/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        
        if emailField.text == "dl" && passwordField.text == "ok" {
            
            performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
        else {
            let alertController = UIAlertController(title: "Bad Credentials", message: "Did you forget your password?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                print("hi")
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (UIAlertAction) in
                print("hi")
            })
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
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
