//
//  tutorialViewController.swift
//  W2_HW_Carousel
//
//  Created by Daniel Lin on 10/23/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class tutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var pageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 375))
        print(page)
        
        // Set the current page, so the dots will update
        pageController.currentPage = page
        
        // optional milestone
        if page == 3
        {
            pageController.isHidden = true
            UIView.animate(withDuration: 0.3, animations: { 
                self.buttonsView.alpha = 1
            })
        }
        else
        {
            pageController.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {
                self.buttonsView.alpha = 0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: pageView.frame.width * 4, height: pageView.frame.height)
        scrollView.delegate = self
        
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
