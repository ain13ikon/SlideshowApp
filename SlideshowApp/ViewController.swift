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
    var image_Max_Number: Int!  //※枚数−１を設定する
//    var images_: [UIImage] = []
    var imageFileName = ["cat126IMGL6511_TP_V.jpg", "N825_pocyankawaii_TP_V.jpg", "nuko-2_TP_V.jpg", "nuko-8_TP_V.jpg", "tdog17030720_TP_V.jpg"]
    var slideShow_Timer: Timer!
    var slideShowPlaying_Flag: Bool! = false    //スライドショーを実行中かどうか
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playStopButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    //画面遷移の準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のBigImageを取得する
        let bigImage: BigImage = segue.destination as! BigImage
        bigImage.imageBig = UIImage(named: imageFileName[imageNumber])
    }
    
    //bigImageへ画面遷移
    @IBAction func imageViewTapped(_ sender: Any) {
        print("デバッグ：　\(imageNumber)の画像がタップされました")
        //スライドショーの停止
        if slideShowPlaying_Flag {
            print("デバッグ：　スライドショーを停止しました")
            self.slideShow_Timer.invalidate()
        }
 
        performSegue(withIdentifier: "slideTobig", sender: imageNumber)
    }
    
    //画像の表示
    func previewImage(){
        print("デバッグ：　\(imageNumber)番目の画像を表示")
        imageView.image = UIImage(named: imageFileName[imageNumber])
        //修正：imageView.image = images_[imageNumber] ↑に変えて良い images_配列を作らずその場で指定
    }
    
    //再生・停止の切り替え
    @IBAction func playStop(_ sender: UIButton) {
        if self.playing_Flag {
            //停止の処理//
            playStopButton.setTitle("再生", for: .normal)
            slideShowPlaying_Flag = false
            self.slideShow_Timer.invalidate()
            
            //戻る・進むを使用可能に
            nextButton.isEnabled = true
            backButton.isEnabled = true
            nextButton.setTitleColor(UIColor.brown, for: .normal)
            backButton.setTitleColor(UIColor.brown, for: .normal)
        }else{
            //再生の処理//
            playStopButton.setTitle("停止", for: .normal)
            slideShowPlaying_Flag = true
            
            //戻る・進むを使用不可に
            nextButton.isEnabled = false
            backButton.isEnabled = false
            nextButton.setTitleColor(UIColor.lightGray, for: .normal)
            backButton.setTitleColor(UIColor.lightGray, for: .normal)
            
            //スライドショーを開始
            slideShow_Timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(nextImage),
                userInfo: nil,
                repeats: true
            )
        }
        self.playing_Flag = !self.playing_Flag
        
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
    //スライドショーで次の画像を表示する
    @objc @IBAction func nextImage() {
        imageNumber += 1
        if imageNumber > image_Max_Number {
            imageNumber = 0
        }
        
        previewImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //修正：画像の読み込み
        /*
         不要。
         その場で読み込めば良い。
        for fileName in imageFileName {
            let image: UIImage! = UIImage(named: fileName)
            images_.append(image)
        }
        */
        
        image_Max_Number = imageFileName.count - 1
        print("デバッグ：　image_Max_Number = \(image_Max_Number)")
        
        //表示サイズの調整
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        //初期画像の表示
        imageView.image = UIImage(named: imageFileName[0])
        
        print("デバッグ：　初期処理がされました")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //bigImageから戻った時
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        print("デバッグ：　拡大画像から戻りました。スライドショー：\(slideShowPlaying_Flag)")
        if slideShowPlaying_Flag {
            //スライドショーを開始
            slideShow_Timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(nextImage),
                userInfo: nil,
                repeats: true
            )
            print("デバッグ：　スライドショーを再開させました")
        }
    }

}

