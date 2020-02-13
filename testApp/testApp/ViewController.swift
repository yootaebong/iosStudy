//
//  ViewController.swift
//  testApp
//
//  Created by taebong you on 2020/02/12.
//  Copyright © 2020 taebong you. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //화면 이동을 담당하는 버튼 이벤트.
    @IBAction func ClickMoveBtn(_ sender: Any) {
        //1. 스토리보드에서 이동을 할 컨트롤러를 찾는다.
            //컨트롤러를 담을 변수를 만들어야 한다.
            //let , var 가 있다.
        //옵셔널 바인딩 : 변수가 있을 때에만 작동 한다.
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "detailController"){
            //move controller
            self.navigationController?.pushViewController(controller, animated: true)
        }
        //2. 실제로 이동을 해야 한다.
        
    }
    
}

