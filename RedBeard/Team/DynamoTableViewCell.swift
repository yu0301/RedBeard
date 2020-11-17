//
//  DynamoTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class DynamoTableViewCell: UITableViewCell {

    let headShotimageView:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: fullScreenX * 0.05, y: fullScreenY * 0.025, width: fullScreenY * 0.15, height: fullScreenY * 0.15))
        imageView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = fullScreenY * 0.075
        return imageView
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: fullScreenX * 0.4, y:fullScreenY * 0.025 , width: fullScreenX * 0.5, height: fullScreenY * 0.03))
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        return label
    }()
    
    let positionLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: fullScreenX * 0.4, y:fullScreenY * 0.075 , width: fullScreenX * 0.5, height: fullScreenY * 0.03))
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    let expertiseLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: fullScreenX * 0.4, y:fullScreenY * 0.125 , width: fullScreenX * 0.5, height: fullScreenY * 0.03))
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(expertiseLabel)
        contentView.addSubview(headShotimageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
