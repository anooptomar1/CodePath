//
//  contentViewController.swift
//  W4_HW_Tumblr
//
//  Created by Daniel Lin on 11/6/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class contentViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!

    // Create an IBOutlet array named, buttons to hold your tab bar buttons.
    @IBOutlet var buttons: [UIButton]!
    
    // Define variables to hold each ViewController associated with a tab.
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    //Define a variable for an array to hold the ViewControllers named, viewControllers.
    var viewControllers: [UIViewController]!
    
    //Define a variable to keep track of the tab button that is selected. Set it to an initial value of 0. We will link the button's tag value to this variable. So an initial value of 0 will reference our first button.
    var selectedIndex: Int = 0
    
    
    @IBOutlet weak var explorePopUp: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Within the ViewDidLoad() method, access the main Storyboard through code.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Next, instantiate each ViewController by referencing storyboard and the particular ViewController's Storyboard ID
        homeViewController = storyboard.instantiateViewController(withIdentifier: "tab0")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "tab1")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "tab3")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "tab4")
        

        // Add each ViewController to your viewControllers array
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]

        // Set the Initial Tab when the App Starts.
        // We will plug in buttons[selectedIndex] as arguments in the didPressTab method to specify the initial button, since we haven't actually "tapped" a button yet and there is no sender to access.
        buttons[selectedIndex].isSelected = true
        didTap(buttons[selectedIndex])
        
        UIView.animate(withDuration:0.8, delay: 0.0,
                       // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
            options: [.autoreverse,.repeat], animations: { () -> Void in
                self.explorePopUp.transform = CGAffineTransform(translationX: 0, y: 10)
            }, completion: nil)
        
    }
    
    
    // Create a Shared Action for the Buttons.
    @IBAction func didTap(_ sender: UIButton) {
        
        // Remember when we changed AnyObject to UIButton when we hooked up our action? That is so we can access special properties of buttons, like accessing their tag value.



        // PREVIOUS
        // Get Access to the Previous and Current Tab Button.
        let previousIndex = selectedIndex

        
        // Remove the Previous ViewController and Set Button State.
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        //Remove the previous ViewController
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()

        
        // CURRENT
        // Add the New ViewController and Set Button State.
        selectedIndex = sender.tag
        // Use the selectedIndex to access the current ViewController from the viewControllers array.
        let vc = viewControllers[selectedIndex]
        // Add the new ViewController. (Calls the viewWillAppear method of the ViewController you are adding)
        addChildViewController(vc)
        // Adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView.
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        // Call the viewDidAppear method of the ViewController you are adding using didMove(toParentViewController: self).
        vc.didMove(toParentViewController: self)

        // Set the Initial Tab when the App Starts.
        buttons[selectedIndex].isSelected = true
        
        // Optional: Explore Pop Up
        if vc is searchViewController{
            explorePopUp.alpha = 0
        } else {
            explorePopUp.alpha = 1
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
