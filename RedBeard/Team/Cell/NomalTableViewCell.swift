//
//  NomalTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit



extension UITableViewCell{
    var id :String{
        return "\(Self.self)"
    }
}

class NormalTableViewCell: UITableViewCell {
    
    let headShotImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: fullScreenX * 0.05, y: fullScreenY * 0.025, width: fullScreenY * 0.15, height: fullScreenY * 0.15))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = fullScreenY * 0.075
        return imageView
    }()
    
    var nameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    let positionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    let expertiseLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    //MARK: - separator view
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
 //MARK: - constriants
    
    func setNameLabelConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: fullScreenY * 0.0275).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: positionLabel.topAnchor,constant: -fullScreenY * 0.0275).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: headShotImageView.trailingAnchor,constant: fullScreenX * 0.05).isActive = true
    }
    
    func setPositionLabelConstraint(){
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        positionLabel.bottomAnchor.constraint(equalTo: expertiseLabel.topAnchor,constant: -fullScreenY * 0.0275).isActive = true
        positionLabel.leadingAnchor.constraint(equalTo: headShotImageView.trailingAnchor,constant: fullScreenX * 0.05).isActive = true
        positionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: fullScreenX * -0.05).isActive = true
    }
    
    func setExpertiseLabelConstraint(){
        expertiseLabel.translatesAutoresizingMaskIntoConstraints = false
        expertiseLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor).isActive = true
        expertiseLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -fullScreenY * 0.0275).isActive = true
        expertiseLabel.leadingAnchor.constraint(equalTo: headShotImageView.trailingAnchor,constant: fullScreenX * 0.05).isActive = true
        expertiseLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: fullScreenX * -0.05).isActive = true
    }
    
    func setSeparatorViewConstraints(){
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalTo: heightAnchor ,multiplier: 0.005).isActive = true
        separatorView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.95).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.025).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    //MARK:- setCell
    func setCell(results:Results){
//        let url = URL(string: results.avatar!)
        let url = results.avatarURL
        headShotImageView.load(url: url!)
        nameLabel.text = results.name
        positionLabel.text = results.position
        expertiseLabel.text = String.transArrayToString(array:results.expertise!)
    }

//    override func prepareForReuse() {
////        super.prepareForReuse()
//        headShotImageView.image = nil
//    }
//    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(headShotImageView)
        addSubview(nameLabel)
        addSubview(positionLabel)
        addSubview(expertiseLabel)
        addSubview(separatorView)
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
        string.removeLast()
     return string
    }
}
