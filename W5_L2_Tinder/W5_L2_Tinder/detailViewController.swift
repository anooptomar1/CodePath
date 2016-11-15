//
//  detailViewController.swift
//  W5_L2_Tinder
//
//  Created by Daniel Lin on 11/10/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    class detailViewController : UIViewController {
        var image: UIImage!
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
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
