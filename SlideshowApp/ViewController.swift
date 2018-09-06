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
    
    @IBOutlet weak var playStopButton: UIButton!
    
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

