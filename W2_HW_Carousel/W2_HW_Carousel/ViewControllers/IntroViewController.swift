//
//  IntroViewController.swift
//  W2_HW_Carousel
//
//  Created by Daniel Lin on 10/22/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
        
    // Arrays of initial transform values for tiles
    var yOffsets  : [CGFloat] = [-335, -320, -495, -448, -610, -570]
    var xOffsets  : [CGFloat] = [ -90,   35,   66,   80, -140,  -95]
    var scales    : [CGFloat] = [   1, 1.75,  1.8,  1.9, 1.75, 1.75]
    var rotations : [CGFloat] = [ -10,  -10,   10,   10,   10,  -10]
    
    var final_yOffsets  : [CGFloat] = []
    var final_xOffsets  : [CGFloat] = []
    var final_scales    : [CGFloat] = []
    var final_rotations : [CGFloat] = []
    var tiles : [UIImageView] = []
    
    //var tx: Double!
    var ty: Double!
    var scale: Double!
    var rotation: Double!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let start  = CGFloat(-20)
        let end    = CGFloat(673)
        var offset = CGFloat(scrollView.contentOffset.y)
        let numberOfTiles = tiles.count
        
        if offset > end { offset = end }
        if offset < start { offset = start }
        
        for i in 0 ..< numberOfTiles
        {
            //Get Current Tile
            let tile = tiles[i]
            
            //Calculate Values
            let tx = convertValue(inputValue: offset, r1Min: start, r1Max: end, r2Min: xOffsets[i], r2Max: 0)
            let ty = convertValue(inputValue: offset, r1Min: start, r1Max: end, r2Min: yOffsets[i], r2Max: 0)
            let scale = convertValue(inputValue: offset, r1Min: start, r1Max: end, r2Min: scales[i], r2Max: 1)
            let rotation_radians = convertValue(inputValue: offset, r1Min: CGFloat(start), r1Max: CGFloat(end), r2Min: rotations[i], r2Max: 0)
            let rotation_degrees = CGFloat(Double(rotation_radians) * M_PI / 180)
            
            //Apply Transform
            tile.transform = CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
            tile.transform = tile.transform.scaledBy(x: scale, y: scale)
            tile.transform = tile.transform.rotated(by: rotation_degrees)
        }
        
        print(scrollView.contentOffset.y)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        
        tiles = [tile1, tile2, tile3, tile4, tile5, tile6]
        
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
