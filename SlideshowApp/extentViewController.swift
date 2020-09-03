//
//  extentViewController.swift
//  SlideshowApp
//
//  Created by 菅原大輝 on 2020/08/24.
//  Copyright © 2020 菅原大輝. All rights reserved.
//

import UIKit

class extentViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    //viewControllerから受け取る変数
    var showImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //viewControllerから受け取った画像を表示
        imageView.image = showImage
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
