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
    var imageFileName = ["cat126IMGL6511_TP_V.jpg", "N825_pocyankawaii_TP_V.jpg", "nuko-2_TP_V.jpg", "nuko-8_TP_V.jpg", "tdog17030720_TP_V.jpg"]
    var slideShow_Timer: Timer!
    var slideShowPlaying_Flag: Bool = false //スライドショーを実行中かどうか
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playStopButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func imageViewTapped(_ sender: Any) {
        print("デバッグ：　画像がタップされました")
    }
    
    //画像の読み込み
    private func initImageView(){
        for fileName in imageFileName {
            let image: UIImage! = UIImage(named: fileName)
            images_.append(image)
        }
        
        image_Max_Number = imageFileName.count - 1
        print("デバッグ：　image_Max_Number = \(image_Max_Number)")
        imageView.image = images_[0]
    }
    
    //画像の表示
    func previewImage(){
        print("デバッグ：　\(imageNumber)番目の画像を表示")
        imageView.image = images_[imageNumber]
    }
    
    //スライドショーの処理
    @objc func slideShowImage() {
        imageNumber += 1
        if imageNumber > image_Max_Number {
            imageNumber = 0
        }
        
        previewImage()
    }
    
    //再生・停止の切り替え
    func changePlayStop(){
        if self.playing_Flag {
            //停止の処理//
            playStopButton.setTitle("再生", for: .normal)
            self.slideShow_Timer.invalidate()
            
            //戻る・進むを使用可能に
            nextButton.isEnabled = true
            backButton.isEnabled = true
            nextButton.setTitleColor(UIColor.brown, for: .normal)
            backButton.setTitleColor(UIColor.brown, for: .normal)
        }else{
            //再生の処理//
            playStopButton.setTitle("停止", for: .normal)
            
            //戻る・進むを使用不可に
            nextButton.isEnabled = false
            backButton.isEnabled = false
            nextButton.setTitleColor(UIColor.lightGray, for: .normal)
            backButton.setTitleColor(UIColor.lightGray, for: .normal)
 
            
            //スライドショーを開始
            slideShow_Timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(slideShowImage),
                userInfo: nil,
                repeats: true
            )
            
        }
        self.playing_Flag = !self.playing_Flag
    }

    @IBAction func playStop(_ sender: UIButton) {
        changePlayStop()
    }
    
    //戻るボタンの処理
    @IBAction func beforeImage() {
        //if slideShowPlaying_Flag {return}
    
        imageNumber -= 1
        if imageNumber < 0 {
            imageNumber = image_Max_Number
        }
        
        previewImage()
        
    }
    
    //進むボタンの処理
    @IBAction func nextImage() {
        //if slideShowPlaying_Flag {return}
        
        imageNumber += 1
        if imageNumber > image_Max_Number {
            imageNumber = 0
        }
        
        previewImage()
    }
    
    /*
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        print("デバッグ：　タップされました")
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initImageView()
        
        
        //imageViewのタップをオンに
        /*
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
        */
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

