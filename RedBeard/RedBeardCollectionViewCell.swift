//
//  RedBeardCollectionViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class RedBeardCollectionViewCell: UICollectionViewCell {
    
    let teamLabel:UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(teamLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
