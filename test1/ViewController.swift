//
//  ViewController.swift
//  test1
//
//  Created by Makoto Kaneko on 2018/09/19.
//  Copyright © 2018年 Makoto Kaneko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    
    @IBAction func behind(_ sender: Any) {
        dispImageNO += 1
        displayImage()
    }
    @IBAction func Forward(_ sender: Any) {
        dispImageNO -= 1
        displayImage()
    }
    @IBAction func auto(_ sender: Any) {
        //タイマー設定
    timer = Timer.scheduledTimer (timeInterval: 2.0, target: self, selector : #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }

//一定の間隔で処理を行うためのタイマー
    var timer : Timer!
    
//表示している画像の番号
    var dispImageNO = 0
    
//表示している画像の番号を元に画像を表示する
    func displayImage(){
        let imageNameArray = ["AIRDO.jpg","ANA.jpg","JAL.jpg","SFJ.jpeg","SNJ.jpg",]
//範囲より下を指している場合、最後の画像を表示
        if dispImageNO < 0{
            dispImageNO = 4
        }
//範囲より上を指している場合、最初の画像を表示
        if dispImageNO > 4{
            dispImageNO = 0
        }
//表示している画像の番号から名前を取り出し
        let name=imageNameArray[dispImageNO]
//画像の読み込み
        let image = UIImage(named: name)
//Image viewに読み込んだ画像をセット
        imageview.image = image
        }
    override func viewDidLoad() {
        super.viewDidLoad()
//①バンドルした画像ファイルを読み込み。②UIImageViewに画像をくくりつけ
       let image = UIImage(named : "ANA.jpg")
      imageview.image = image
        
 //タイマー設定
   //     timer = Timer.scheduledTimer (timeInterval: 2.0, target: self, selector : #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    //NSTimaerによって一定の間隔で呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 関数が呼ばれていることを確認
        print("onTimer")
//表示している画像の番号を1増やす
        dispImageNO += 1
        
//表示している画像の番を元に画像を表示
        displayImage()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

