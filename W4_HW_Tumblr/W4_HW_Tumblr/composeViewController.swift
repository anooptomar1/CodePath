//
//  composeViewController.swift
//  W4_HW_Tumblr
//
//  Created by Daniel Lin on 11/6/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class composeViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    let buttonShift = CGFloat(500)
    //Add a viewWillAppear method to the ComposeViewController. Within the viewWillAppear method, set the initial positions of the compose buttons to below the screen.
    override func viewWillAppear(_ animated: Bool) {
        for index in 0..<buttons.count{
            let button = buttons[index]
            button.center.y += buttonShift
        }
    }
    
    //Add a viewDidAppear method. Within the viewDidAppear method, schedule the animations of the compose buttons.
    override func viewDidAppear(_ animated: Bool) {
        for index in 0..<buttons.count{
            let button = buttons[index]
            let buttonDelay = Double(index) * 0.1
            UIView.animate(withDuration: 0.4, delay: buttonDelay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.6, options: [], animations: {
                    button.center.y -= self.buttonShift
                }, completion: { (Bool) in
            }) 
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nevermindDidTap(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
