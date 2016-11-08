//
//  homeViewController.swift
//  W4_HW_Tumblr
//
//  Created by Daniel Lin on 11/6/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIImageView!
    var originalViewCenter: CGPoint!
    var offsetViewCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        //originalViewCenter = loginView.center
        //offsetViewCenter = CGPoint(x:originalViewCenter.x, y: originalViewCenter.y - 150)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelDidTap(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
