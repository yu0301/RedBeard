//
//  RedSoTableTableViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit

class RedSoTableViewController: UITableViewController {
    
    enum PageStatus {
        case LoadingMore
        case NotLoadingMore
    }
    
    enum TeamName:Int,CaseIterable{
        case rangers
        case elastic
        case dynamo
        
        var string:String{
            switch self{
            
            case .rangers:
                return "rangers"
            case .elastic:
                return "elastic"
            case .dynamo:
                return "dynamo"
            }
        }
    }
    
    //設定當前狀態，決定頁面
    var cellData:[Results] = [Results](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    //tag給翻頁用的參數
    var team:TeamName!{
        didSet{
            self.view.tag = team.rawValue
        }
    }

    var page = 0
    
    var pageStatus:PageStatus = .NotLoadingMore
    
    //MARK:- 無限列車
    let blankData = [Results(id: "", type: "", name: "", position: "", expertise: [""], avatar: "", url: "")]
    
    func getCellData(){
        let dataRequest = HTTPRequest()
        dataRequest.load(teamName: self.team.string, pageNumber: self.page) { (res:Result< GetData ,NetWorkError>) in
            
            switch res{
            case .success(let data):
                self.cellData = data.results
            case .failure(let error):
                print(error.description)
            }
        }
    }
    
    //MARK: - set cell
    
    func generateNormalCell(indexPath:IndexPath,result:Results) -> NormalTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as!NormalTableViewCell
        let results = cellData[indexPath.row]
        cell.setCell(results: results)
        return cell
    }
    
    func generateBannerCell(indexPath:IndexPath,result:Results)-> BannerTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as!BannerTableViewCell
        let results = cellData[indexPath.row]
        cell.setCell(results: results)
        return cell
    }
    
    func generateLoadingCell(indexPath:IndexPath)->LoadingTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as!LoadingTableViewCell
        cell.activityIndicater.startAnimating()
        return cell
    }
    
    func generateMugenTrainCell(indexPath:IndexPath)->BlankTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "blankCell", for: indexPath) as! BlankTableViewCell
        cell.mugenTrainLabel.text = "無限列車\(indexPath.row)"
        return cell
    }
    
    convenience init(team:TeamName){
        self.init(nibName: nil, bundle: nil)
        self.team = team
    }
    
    //滑完觸發
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
       
        guard scrollView.contentSize.height > self.tableView.rowHeight else {return}
        
        //all row range - (tabkeview range + 滾到位置)
        if scrollView.contentSize.height - (scrollView.frame.size.height + scrollView.contentOffset.y) <= -10{
            self.pageStatus = .LoadingMore
            //重新下載檔案
            let dataRequest = HTTPRequest()
            self.page += 1
            
            dataRequest.load(teamName: self.team.string, pageNumber: self.page) { (res:Result<GetData, NetWorkError>) in
                switch res{
                case .success(let data):
                    self.cellData += data.results
                    if self.cellData.count >= 10{
                        for _ in 0...4{
                            self.cellData += self.blankData
                        }
                    }
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.description)
                }
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NormalTableViewCell.self, forCellReuseIdentifier: "normalCell")
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "bannerCell")
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: "loadingCell")
        tableView.register(BlankTableViewCell.self, forCellReuseIdentifier: "blankCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tableView.allowsSelection = false
        tableView.frame = CGRect(x: 0, y: fullScreenY * 0.3, width: fullScreenX * 0.5, height: fullScreenY * 0.7)
        self.view.tag = team.rawValue
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        getCellData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let resultCell = cellData[indexPath.row]
        
        switch resultCell.type!{
        case "banner":
            return fullScreenY * 0.2
        case "employee":
            return UITableView.automaticDimension
        default:
            return fullScreenY * 0.2
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var row:Int = 0
        
        switch pageStatus{
        case .LoadingMore:
            row = cellData.count + 1
        case .NotLoadingMore:
            row = cellData.count
        }
        return cellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        let resultCell = cellData[indexPath.row]
        if indexPath.row == cellData.count{
            cell = generateLoadingCell(indexPath: indexPath)
        }else if resultCell.type == "employee"{
            cell = generateNormalCell(indexPath: indexPath, result: resultCell)
        }else if resultCell.type == "banner"{
            cell = generateBannerCell(indexPath: indexPath, result: resultCell)
        }else if self.cellData.count >= 10{
            cell = generateMugenTrainCell(indexPath: indexPath)
        }
        return cell
    }
}
