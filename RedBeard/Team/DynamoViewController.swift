//
//  DynamoViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class DynamoViewController: UIViewController {

    
    var dynamoTableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: -20, width: fullScreenX, height: fullScreenY))
        tableView.rowHeight = fullScreenY * 0.2
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
//        tableView.bounces = false
        tableView.register(DynamoTableViewCell.self, forCellReuseIdentifier: "dynamoTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 2
        view.addSubview(dynamoTableView)
        dynamoTableView.delegate = self
        dynamoTableView.dataSource = self
    }
    

}

extension DynamoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dynamoTableView.dequeueReusableCell(withIdentifier: "dynamoTableViewCell", for: indexPath) as! DynamoTableViewCell
       
        return cell
    }
    
    
}
