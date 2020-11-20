//
//  RedBeardCollectionViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class RedSoCollectionViewCell: UICollectionViewCell {
    
    let teamLabel:UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        return label
    }()
    
    func setTeamLabelConstraints(){
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        teamLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        teamLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(teamLabel)
        setTeamLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
