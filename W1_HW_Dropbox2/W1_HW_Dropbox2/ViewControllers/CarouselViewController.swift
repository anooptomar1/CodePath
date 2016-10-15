//
//  CarouselViewController.swift
//  W1_HW_Dropbox2
//
//  Created by Daniel Lin on 10/14/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var carouselImage: UIImageView!
    @IBOutlet weak var carouselScroll: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselScroll.contentSize = CGSize(width:1095, height: 667)//carouselImage.frame.size
        carouselScroll.delegate = self
        
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
    
        // Set the current page, so the dots will update
        pageControl.currentPage = page
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
