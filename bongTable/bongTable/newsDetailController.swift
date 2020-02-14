//
//  newsDetailController.swift
//  bongTable
//
//  Created by taebong you on 2020/02/14.
//  Copyright © 2020 taebong you. All rights reserved.
//

import UIKit

class NewsDetailContoller : UIViewController {
    
    //뉴스기사 메인 이미지
    @IBOutlet weak var imageMain: UIImageView!
    //뉴스기사 메인 제목.
    @IBOutlet weak var labelMain: UILabel!
    
    
    //1. 이미지 주소 받아오기.
    //2. 본문 내용 받아오기
    //값이 있을수도 없을수도 있으니 옵셔널 바인딩.
    var imageUrl: String?
    var desc: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //값이 있을 경우
        if let img = imageUrl{
            //이미지 주소가 있을 경우 화면에 표시한다.
            //얼레핑
            if let url = imageUrl{
                    if let data = try? Data(contentsOf: URL(string : url)!){
                        //쓰레드 작업이 아닌 메인에서 작업을 해라. 라고 명명해주기.
                        DispatchQueue.main.async {
                            self.imageMain.image = UIImage(data: data)
                        }
                        
                    }
            }
            
        }
        
        if let label = desc{
            //설명란이 있을 경우 가져온다.
            self.labelMain.text = label
        }
    }
    
    
}
