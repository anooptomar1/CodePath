//
//  existing_photosViewController.swift
//  W1_HW_Dropbox2
//
//  Created by Daniel Lin on 10/14/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class existing_photosViewController: UIViewController {

    
    @IBOutlet weak var photo_scroll: UIScrollView!
    @IBOutlet weak var photo_img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo_scroll.contentSize = photo_img.frame.size
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
