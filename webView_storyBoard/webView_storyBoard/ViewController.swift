//
//  ViewController.swift
//  webView_storyBoard
//
//  Created by taebong you on 2020/02/13.
//  Copyright © 2020 taebong you. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webViewConnect: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //웹뷰 불러오기
        //url 스트링 찾기.
        //url 주소를 request 로 바꾸기.
        //url 주소를 load 한다.
        
        //url 스트링 만들기
        let urlString = "https://www.google.co.kr"
        //옵셔널 바인딩.
        if let url = URL(string: urlString){
            //비어 있을수도 있지만 진짜 값이 들어있으면 값을 넣어라.
            //url to request
            let urlReq = URLRequest(url : url)
            webViewConnect.load(urlReq)
        }
        
        //언랩 설명.
        var abc = "1"
        //abc1 은 널 값일수도 있다.
        var abc1 : String? = nil;
        
        let aaa = abc1! // 이건 강제로 언레핑한것이다. nil을 강제로 벗기면 에러가 생긴다.
        let abc2 = "2"
        
    }

    
    
}

