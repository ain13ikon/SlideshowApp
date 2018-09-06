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
    //var images_ = []
    var imageNumber = 0
    //var image_Max: Int!
    var image_Max_Number: Int!  //枚数−１
    var images_: [UIImage] = []
    var imageFileName = ["犬1.jpg", "犬2.jpg", "犬3.jpg"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playStopButton: UIButton!
    
    //画像の読み込み
    private func initImageView(){
        /*
        for i in 1...3 {
            let fileName = "犬\(i).jpg"
            let image: UIImage! = UIImage(named: fileName)
            images_.append(image)
        }
        */
        
        for fileName in imageFileName {
            let image: UIImage! = UIImage(named: fileName)
            images_.append(image)
        }
        image_Max_Number = imageFileName.count - 1
        print("デバッグ：　image_Max_Number = \(image_Max_Number)")
        imageView.image = images_[0]
    }
    
    func previewImage(){
        print("デバッグ：　\(imageNumber)番目の画像を表示")
        imageView.image = images_[imageNumber]
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
            imageNumber = image_Max_Number
        }
        
        previewImage()
    }
    
    @IBAction func nextImage() {
        imageNumber += 1
        if imageNumber > image_Max_Number {
            imageNumber = 0
        }
        
        previewImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initImageView()
        
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

