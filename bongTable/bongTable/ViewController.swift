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
    
    //1. http통신 방법
    //2. 뉴스 정보 (json) 데이터 형태
    //3. 테이블뷰의 데이터 매칭! 후 뿌리도록 통보. 테이블 뷰는 화면을 다시 그린다.
    // !!!!! 네트워크 통신은 백그라운드에서 동작하게 된다.
    // 백그라운드에서 작업된 다음 메인에서 화면을 그리라고 말해야 한다.
    
    var newsData: Array<Dictionary<String,Any>>?
    
    func getNews(){
        let task = URLSession.shared.dataTask(with:URL(string : "https://newsapi.org/v2/top-headlines?country=kr&apiKey=9a8b41d6457e44debd42d8b8f98cada4")!){ (data, response, error) in
            //옵셔널 바인딩
            if let dataJson = data{
                do {
                    //swift에는 json을 dictionary로 거의 보고 있다.
                    let json = try JSONSerialization.jsonObject(with : dataJson, options: []) as! Dictionary<String,Any>
                    
                    let article = json["articles"] as! Array<Dictionary<String,Any>>;
                    
                    self.newsData = article
                    //데이터가 완료가 되면 메인에서 ui를 그려라.
                    DispatchQueue.main.async {
                            self.tableViewMain.reloadData()
                    }
                    
                    
                }
                catch{}
            }
            
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터가 몇개인지 다루는 코드
        if let news = newsData{
            return news.count
        }else{
            return 0
        }
        
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
        let index = indexPath.row
        
        if let news = newsData{
            let row = news[index]
            if let r = row as? Dictionary<String,Any>{
                if let title = r["title"] as? String {
                        cell.labelText.text = title
                }
                
            }
        }
        
        return cell
    }
    
    //셀 클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let stroyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let newsDetail = stroyboard.instantiateViewController(identifier: "NewsDetailContoller") as! NewsDetailContoller
        
        //데이터 보내기
        if let news = newsData{
                let row = news[indexPath.row]
                
                if let r = row as? Dictionary<String,Any>{
                    
                    if let desc = r["description"] as? String {
                        newsDetail.desc = desc
                    }
                    if let img = r["urlToImage"] as? String{
                        newsDetail.imageUrl = img
                    }
                }
        }
        
        //이동!
        showDetailViewController(newsDetail, sender: nil)
    }
    //1. 상세 화면 만듥
    //2. 값을 보내기
    //  2-1 tableview delegate
    //  2-2 storyboard (segue)
    //      2-2-1. 세그웨이로 보내기
    //3. 화면 이동.
    
    //2-2-1
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //만약 아이디에 이름이 들어있고, 들어 있는 이름이 newsDetail과 같다면?
        if let id = segue.identifier, "newDetail" == id {
            //세그웨이의 목적지가 NewsDetailConttroller라면?
//            let controler = segue.destination as? NewsDetailConttoller{
//
//                if let news = newsData{
//
//                }
//                controler?.imageUrl =
//                controler?.labelMain =
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //여기에서 셀프가 의미하는 것은 클래스 안에 들어가있는 함수들을 의미한다.
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        getNews()
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

