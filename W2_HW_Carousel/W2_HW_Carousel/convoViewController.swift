//
//  convoViewController.swift
//  W2_HW_Carousel
//
//  Created by Daniel Lin on 10/23/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class convoViewController: UIViewController {
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
