//
//  RangersViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class RangersViewController: UIViewController {
    var nameArray = [String]()
    var positionArray = [String]()
    var avantarArray = [String]()
    var refreshControl: UIRefreshControl!
    
    var rangersTableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: -20, width: fullScreenX, height: fullScreenY ))
        tableView.rowHeight = fullScreenY * 0.2
//        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
//        tableView.bounces = false
        tableView.register(RangersTableViewCell.self, forCellReuseIdentifier: "rangersTableViewCell")
        return tableView
    }()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 0
//        view.addSubview(rangersTableView)
//        view = RedSoTableTableViewController().view
        rangersTableView.delegate = self
        rangersTableView.dataSource = self
    } 
}


extension RangersViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fullScreenY * 0.2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rangersTableView.dequeueReusableCell(withIdentifier: "rangersTableViewCell", for: indexPath) as! RangersTableViewCell
//        cell.nameLabel.text = nameArray[indexPath.row]
//        cell.positionLabel.text = positionArray[indexPath.row]
//        cell.headShotImageView.load(url: avantarArray[indexPath.row])
//        cell.expertiseLabel.text = avantarArray[indexPath.row]
        switch indexPath.row{
        case 0:
            cell.putImageAndLabelOnCell()
            return cell
        case 1:
            cell.addSubview(cell.bannerImageView)
            return cell
        case 2:
            cell.putImageAndLabelOnCell()
            return cell
        case 3:
            cell.putImageAndLabelOnCell()
            return cell
        case 4:
            cell.addSubview(cell.bannerImageView)
            return cell
        case 5:
            cell.putImageAndLabelOnCell()
            return cell
        case 6:
            cell.putImageAndLabelOnCell()
            return cell
        case 7:
            cell.putImageAndLabelOnCell()
            return cell
        case 8:
            cell.addSubview(cell.bannerImageView)
            return cell
        case 9:
            cell.putImageAndLabelOnCell()
            return cell
        default:
            fatalError()
        }
    }
}

extension RangersViewController:PassRangersName{
    func passRangersName(name: [String]) {
        let afterFilterNilName = name.filter{$0 != ""}
        nameArray = afterFilterNilName
    }
}

extension RangersViewController:PassRangersPosition{
    func passRangersPositon(position: [String]) {
        let afterFilterPosition = position.filter{$0 != ""}
        positionArray = afterFilterPosition
    }
    
 
}

extension RangersViewController:PassRangersPicture{
    func passRangersPicture(picture: [String]) {
        let afterFilterPicture = picture.filter{$0 != ""}
        avantarArray = afterFilterPicture
    }
    
   
}
