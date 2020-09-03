//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 菅原大輝 on 2020/08/22.
//  Copyright © 2020 菅原大輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var UIImageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //写真3枚を配列で扱うため、要素数を管理する変数
    var imageIndex = 0
    
    //タイマー
    var timer:Timer!
    
    //3枚の画像を配列で管理
    let images = [UIImage(named: "river"), UIImage(named: "night"), UIImage(named: "tree")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = images[0]

        UIImageView.image = imageView
        
    }
    
    //進むボタンで次の画像を表示する
    @IBAction func nextImage(_ sender: Any) {
        //最後の写真であれば、押下後は最初の写真へ
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        //imageIndex番目の画像を表示
        UIImageView.image = images[imageIndex]
    }
    
    //戻るボタンで前の画像に戻る
    @IBAction func backImage(_ sender: Any) {
        //最初の写真であれば、押下後は最後の写真へ
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        //imageIndex番目の画像を表示
        UIImageView.image = images[imageIndex]
    }
    
    //再生ボタンを押下後、2秒毎に写真がスライドする
    @IBAction func startStop(_ sender: Any) {
        //再生ボタン押下後
        if self.timer == nil {
            
            //タイマーの作成・始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(_timer:)), userInfo: nil, repeats: true)
            
            //ボタンは停止ボタンに切り替わる
            button.setTitle("停止", for: .normal)
            
            //進むボタンと戻るボタンを押下不可にする
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
        } else {
            //　停止させる
            //タイマ－を止める
            self.timer.invalidate()
            //再生ボタンを再び押下した時に、sself.timer == nil を判断させる
            self.timer = nil
            
            //進むボタンと戻るボタンを有効化に戻す
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            // ボタンは再生に切り替わる
            button.setTitle("再生", for: .normal)
            
        }
        
    }
    
    //#selector(ViewController.onTimer(_:))で指定された関数
    @objc func onTimer(_timer:Timer){
        //最後のスライドに来た場合、最初のスライドに戻る
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        //imageIndex番目の画像を表示
        UIImageView.image = images[imageIndex]
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue) {
        //他画面からSegueを使って戻ってきた時に呼ばれる
    }
    
        //segueが反応していない？？
//    @IBAction func tap(_ sender: Any) {
//        //第1引数　遷移先のインスタンス作成
//        //2アニメションの有無
//        //3遷移後に呼び出したい処理
//        self.present(extentViewController(), animated: true, completion: nil)
//    }
    
    //segueを使用して、画像をタップすると、画面遷移させる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のExtentViewControllerを取得する
        let image_move = segue.destination as! extentViewController

        image_move.showImage = self.images[imageIndex]
    }

}

