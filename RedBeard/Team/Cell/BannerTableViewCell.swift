//
//  BannerTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    let bannerImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func bannerImageViewConstraints(){
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
    func setCell(results:Results){
        let url = URL(string: results.url!)
        bannerImageView.load(url: url!)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bannerImageView)
        bannerImageViewConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
