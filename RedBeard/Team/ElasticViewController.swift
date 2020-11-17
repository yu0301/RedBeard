//
//  ElasticViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class ElasticViewController: UIViewController {

    var elesticTableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: -20, width: fullScreenX, height: fullScreenY))
        tableView.rowHeight = fullScreenY * 0.2
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
//        tableView.bounces = false
        tableView.register(ElesticTableViewCell.self, forCellReuseIdentifier: "elesticTableViewCell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 1
        view.addSubview(elesticTableView)
        elesticTableView.delegate = self
        elesticTableView.dataSource = self
    }
}

extension ElasticViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = elesticTableView.dequeueReusableCell(withIdentifier: "elesticTableViewCell", for: indexPath) as! ElesticTableViewCell
       
        return cell
    }
    
    
}
