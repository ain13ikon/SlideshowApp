//
//  ViewController.swift
//  SlideshowApp
//
//  Created by きたむら on 2018/09/05.
//  Copyright © 2018年 ain13ikon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var playing_Flag: Bool! = false
    var imageNumber = 0
    var image_Max: Int! = 4   //枚数−1
    
    @IBOutlet weak var playStopButton: UIButton!
    
    func previewImage(){
        print("デバッグ：　\(imageNumber)番目の画像を表示")
    }
    
    func changePlayStop(){
        if self.playing_Flag {
            playStopButton.setTitle("再生", for: .normal)
            
        }else{
            playStopButton.setTitle("停止", for: .normal)
        }
        self.playing_Flag = !self.playing_Flag
    }

    @IBAction func playStop(_ sender: UIButton) {
        changePlayStop()
    }
    
    @IBAction func beforeImage() {
        imageNumber -= 1
        if imageNumber < 0 {
            imageNumber = image_Max
        }
        
        previewImage()
    }
    
    @IBAction func nextImage() {
        imageNumber += 1
        if imageNumber > image_Max {
            imageNumber = 0
        }
        
        previewImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        self.playing_Flag = false
        playStopButton.setTitle("再生", for: .normal)
        if self.playing_Flag {
            print("デバッグ　\(playing_Flag)")
        }else{
            print("デバッグ　\(playing_Flag)")
        }
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

