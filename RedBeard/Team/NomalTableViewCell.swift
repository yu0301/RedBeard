//
//  NomalTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit

class NormalTableViewCell: UITableViewCell {
    
    let headShotImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: fullScreenX * 0.05, y: fullScreenY * 0.025, width: fullScreenY * 0.15, height: fullScreenY * 0.15))
        imageView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = fullScreenY * 0.075
        return imageView
    }()
    
    var nameLabel:UILabel = {
        let label = UILabel()
//        let label = UILabel(frame: CGRect(x: fullScreenX * 0.4, y:fullScreenY * 0.025 , width: fullScreenX * 0.5, height: fullScreenY * 0.03))
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    let positionLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: fullScreenX * 0.4, y:fullScreenY * 0.075 , width: fullScreenX * 0.5, height: fullScreenY * 0.03))
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    let expertiseLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: fullScreenX * 0.4, y:fullScreenY * 0.125 , width: fullScreenX * 0.5, height: fullScreenY * 0.03))
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - separator view
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    
    //MARK:- constraints
    func setNameLabelConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor,constant: fullScreenX * -0.33).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor,constant: fullScreenY * -0.17).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: headShotImageView.trailingAnchor,constant: fullScreenX * 0.05).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: fullScreenY * 0.0275).isActive = true
    }
    
    func setPositionLabelConstraint(){
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.widthAnchor.constraint(equalTo: widthAnchor,constant: fullScreenX * -0.33).isActive = true
        positionLabel.heightAnchor.constraint(equalTo: heightAnchor,constant: fullScreenY * -0.17).isActive = true
        positionLabel.leadingAnchor.constraint(equalTo: headShotImageView.trailingAnchor,constant: fullScreenX * 0.05).isActive = true
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: fullScreenY * 0.0275).isActive = true
    }
    
    func setExpertiseLabelConstraint(){
        expertiseLabel.translatesAutoresizingMaskIntoConstraints = false
        expertiseLabel.widthAnchor.constraint(equalTo: widthAnchor,constant: fullScreenX * -0.5).isActive = true
        expertiseLabel.heightAnchor.constraint(equalTo: heightAnchor,constant: fullScreenY * -0.17).isActive = true
        expertiseLabel.leadingAnchor.constraint(equalTo: headShotImageView.trailingAnchor,constant: fullScreenX * 0.05).isActive = true
        expertiseLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor,constant: fullScreenY * 0.0275).isActive = true
    }
    
    func setSeparatorViewConstraints(){
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalTo: heightAnchor ,multiplier: 0.005).isActive = true
        separatorView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.95).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.025).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    }
    
    
    func setCell(results:Results){
        let url = URL(string: results.avatar!)
        headShotImageView.load(url: url!)
        nameLabel.text = results.name
        positionLabel.text = results.position
        expertiseLabel.text = String.transArrayToString(array:results.expertise!)
        expertiseLabel.sizeToFit()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.addSubview(nameLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(expertiseLabel)
        contentView.addSubview(headShotImageView)
        contentView.addSubview(separatorView)
        setNameLabelConstraint()
        setPositionLabelConstraint()
        setExpertiseLabelConstraint()
        setSeparatorViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension String{
    static func transArrayToString(array:[String]) -> String{
        var string = ""
        for str in array{
            string += str + ","
        }
     return string
    }
}
