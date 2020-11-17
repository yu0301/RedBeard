//
//  BannerTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    let bannerImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: fullScreenX, height: fullScreenY * 0.2))
        
        return imageView
    }()
    
    func setCell(results:Results){
        let url = URL(string: results.url!)
        bannerImageView.load(url: url!)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bannerImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
