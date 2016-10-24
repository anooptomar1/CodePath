//
//  settingsViewController.swift
//  W2_HW_Carousel
//
//  Created by Daniel Lin on 10/23/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func signOutDidPress(_ sender: AnyObject) {
        // Setup
        let alertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (UIAlertAction) in
            //sign out
            //dismiss(animated: true,completion:nil)
            self.performSegue(withIdentifier: "signOutTransition", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            //dismiss action
        }
        alertController.addAction(signOutAction)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
    
    
    @IBAction func dismissDidPress(_ sender: AnyObject)  {
        dismiss(animated: true,completion:nil)
    }
    
    @IBOutlet weak var closeButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        
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
