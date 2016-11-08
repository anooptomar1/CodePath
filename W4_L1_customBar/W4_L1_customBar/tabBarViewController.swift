//
//  tabBarViewController.swift
//  W4_L1_customBar
//
//  Created by Daniel Lin on 11/1/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class tabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let redViewController = main.instantiateViewController(withIdentifier: "redViewController")
        
        containerView.addSubview(redViewController.view)
        
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
