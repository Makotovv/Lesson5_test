//
//  ViewController.swift
//  test1
//
//  Created by Makoto Kaneko on 2018/09/19.
//  Copyright © 2018年 Makoto Kaneko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
//    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var start: UIButton!
    

    @IBOutlet weak var imagebutton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imagebutton(_ sender: Any) {
    }
    
    

    @IBAction func behind(_ sender: Any) {
//buttonの有効、無効化
// if  スライド動いている時は無効にさせる・再生/停止ボタンで停止の表示中はボタン無効でもある
//        behind.setTileLabel("テストボタン",forState: UIControlState.Normal)
        dispImageNO += 1
        displayImage()
    }
    
    
    
    
    @IBAction func Forward(_ sender: Any) {
// if  スライド動いている時は無効にさせる・再生/停止ボタンで停止の表示中はボタン無効でもある
        dispImageNO -= 1
        displayImage()
    }
    
    
    
    @IBAction func auto(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer (timeInterval: 2.0, target: self, selector : #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            start.setTitle("停止",for: .normal)
            susumu.isEnabled = false
            modoru.isEnabled = false
             } else {
       self.timer.invalidate()
        self.timer = nil
          start.setTitle("再生",for: .normal)
           susumu.isEnabled = true
          modoru.isEnabled = true
        }

       }
        
//タイマー設定 → if関数
//    timer = Timer.scheduledTimer (timeInterval: 2.0, target: self, selector : #selector(updateTimer(_:)), userInfo: nil, repeats: true)
//auto時のラベル変更
//    }
//一定の間隔で処理を行うためのタイマー
    
    
    var timer : Timer!
    
    
//表示している画像の番号
    var dispImageNO = 0
    let imageNameArray = ["AIRDO.jpg","ANA.jpg","JAL.jpg","SFJ.jpeg","SNJ.jpg",]
    
//表示している画像の番号を元に画像を表示する
    func displayImage(){
    //let imageNameArray = ["AIRDO.jpg","ANA.jpg","JAL.jpg","SFJ.jpeg","SNJ.jpg",]
//範囲より下を指している場合、最後の画像を表示
        if dispImageNO < 0{
            dispImageNO = 4
        }
//範囲より上を指している場合、最初の画像を表示
        if dispImageNO > 4{
            dispImageNO = 0
        }
//表示している画像の番号から名前を取り出し
//画像の読み込み
//Imageviewに読み込んだ画像をセット
        let name=imageNameArray[dispImageNO]
        let image = UIImage(named: name)
//        imageview.image = image
//        imagebutton.image = image
//        imagebutton.setImage(UIImage(named:imageNameArray[dispImageNO], for: .normal)
//        imagebutton.setImage(image!, for: .normal)
        imageView.image = image
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//バンドルした画像ファイルを読み込み。 コメント0919　→ 初期の画像
//UIImageViewに画像をセット        コメント0919 → 初期の画像
           let image = UIImage(named : "AIRDO.jpg")
//         imagebutton.image = image
//         imagebutton.setImage(UIImage(named:imageNameArray[dispImageNO], for: .normal)
//           imagebutton.setImage(UIImage(named:image), for: .normal)
//           imagebutton.setImage(image!, for: .normal)
        imageView.image = image

        
        
        
        }
    

    
    
    
//imaerによって一定の間隔で呼び出される関数
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
    
    //segueの設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondviewController :secondViewController = segue.destination as! secondViewController
        
//          secondviewController.selectphoto = UIImage(named: name)
//          secondviewController.selectphoto = image
//          secondviewController.selectphoto = imageview.image
            secondviewController.selectphoto = UIImage(named:imageNameArray[dispImageNO])
        
        
        
    }

    //戻り
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
}


//1つ目の画面ではスライドショー, 2つ目の画面では拡大画像を表示します   >>>> セグエ紐付けまで実施
//画像をタップすると画面を遷移させ、拡大画像と戻るボタンを表示させてください
//戻るボタンがタップされると、スライドショー画面に戻り、同じ画像を表示してください
//プロジェクトを新規作成し、 SlideshowApp というプロジェクト名をつけてください
//Auto Layoutを使用して、iPhone SE, iPhone 8, iPhone 8 Plus, iPhone Xの各画面サイズでレイアウトが崩れないようにしてください
////画面を2つ作成してください
////スライドショー画面には、画像と3つのボタン（進む、戻る、再生/停止）を配置してください
////進むボタンで1つ先の画像を表示し、戻るボタンで1つ前の画像を表示します
////最後の画像の表示時に、進むボタンをタップすると、最初の画像が表示されるようにしてください
////最初の画像の表示時に、戻るボタンをタップすると、最後の画像が表示されるようにしてください
////再生ボタンをタップすると自動送りが始まり、2秒毎にスライドさせてください
////画像は、Xcodeのナビゲーションエリア（Project Navigator）へドラッグアンドドロップし、Copy items if neededにチェックを入れて、Xcodeプロジェクトへコピーしてください
////再生ボタンをタップすると停止ボタンになり、停止ボタンをタップすると再生ボタンにしてください
////自動送りの間は、進むボタンと戻るボタンはタップ不可にしてください
////停止ボタンをタップすると自動送りが止まり、進むボタンと戻るボタンをタップ可能にしてください
