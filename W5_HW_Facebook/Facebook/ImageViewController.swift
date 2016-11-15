//
//  ImageViewController.swift
//  Facebook
//
//  Created by Daniel Lin on 11/14/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var dismissed: Bool!
    
    @IBOutlet weak var ui_action: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.contentSize = bg.frame.size
        scrollView.delegate = self
        dismissed = false
        
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapBack(_ sender: AnyObject) {
        dismiss(animated: true) {}
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if abs(scrollView.contentOffset.y) > 0 && dismissed == false {
            bg.alpha = 1 - abs( scrollView.contentOffset.y) / 100
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if abs(scrollView.contentOffset.y) > 50 {
            dismissed = true
            dismiss(animated: true, completion: nil)
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
