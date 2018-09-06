//
//  BigImage.swift
//  SlideshowApp
//
//  Created by きたむら on 2018/09/06.
//  Copyright © 2018年 ain13ikon. All rights reserved.
//

import UIKit

class BigImage: UIViewController {
    
    var imageBig: UIImage!
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //拡大画像の表示//
        bigImageView.contentMode = UIViewContentMode.scaleAspectFit    //サイズ調整
        bigImageView.image = imageBig   //表示
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
