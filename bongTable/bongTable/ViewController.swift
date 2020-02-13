//
//  ViewController.swift
//  bongTable
//
//  Created by taebong you on 2020/02/13.
//  Copyright © 2020 taebong you. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //초기 설정 구현체값이다. 이게 없으면 안된다.
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터가 몇개인지 다루는 코드
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //데이터 무엇인지 다루는 펑션
        //반복으로 10번을 하는 것일까?
        //방법은 2가지가 있는데
        //일단은 1번 방법만 사용.
        // 1번 -> 임의의 셀 만들기
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "type1")
        // 2번 방법 -> 스토리보드 + identifier 를 매칭해서 작업.
        // 새로이 만든 ui 아이템 클래스와 연결
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "type1", for: indexPath) as! type1
        
        //as라는 개념은? as? as!
        //as? 는 내가 자식이 맞나? 라고 묻는 거고
        //as! 는 내가 자식이 맞다 라고 말하는 것이다.
        
        cell.labelText?.text = "\(indexPath.row)"
        
        return cell
    }
    
    //셀 클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //여기에서 셀프가 의미하는 것은 클래스 안에 들어가있는 함수들을 의미한다.
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
    }

    //tableview???
    //테이블로 된 뷰이다.
//    테이블이란? -> 여러개의 행이 모여있는 목록뷰이다.
//  이걸 왜 쓰는가? -> 정갈하게 보여주기 편하기 때문에.
//    전화번호부 같이..?
//    넣어줄 데이터는??
//    1. 데이터 무엇이니
//    2. 데이터 몇개이니?
//    3. 클릭이벤트 어떻게 처리할꺼니?
    
}

