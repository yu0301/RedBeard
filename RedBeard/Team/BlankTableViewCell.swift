//
//  BlankTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/18.
//

import UIKit

class BlankTableViewCell: UITableViewCell {
    
    var mugenTrainLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 90)
        return label
    }()
    
    //MARK: - separator view
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    func setMugenTrainLabelConstraint(){
        mugenTrainLabel.translatesAutoresizingMaskIntoConstraints = false
        mugenTrainLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mugenTrainLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mugenTrainLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mugenTrainLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setSeparatorViewConstraints(){
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalTo: heightAnchor ,multiplier: 0.005).isActive = true
        separatorView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.95).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.025).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(mugenTrainLabel)
        addSubview(separatorView)
        setMugenTrainLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
