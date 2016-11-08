//
//  searchViewController.swift
//  W4_HW_Tumblr
//
//  Created by Daniel Lin on 11/6/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {
    @IBOutlet weak var searchFeedView: UIImageView!
    @IBOutlet weak var loader: UIImageView!

    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
    
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        loader.image = animatedImage

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchFeedView.alpha = 0
        loader.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delay(1) { 
            self.searchFeedView.alpha = 1
            self.loader.alpha = 0
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
