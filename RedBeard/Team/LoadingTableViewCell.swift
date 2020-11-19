//
//  LoadingTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    let activityIndicater:UIActivityIndicatorView = {
        let activityIndicater = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: fullScreenX , height: fullScreenY * 0.1))
        return activityIndicater
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(activityIndicater)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
