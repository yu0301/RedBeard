//
//  ViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import UIKit

class MainViewController: UIViewController {
    
    let teamName = ["Rangers","Elastic","Dynamo"]
    var TurnToNetPageDelegate:TurnToNetPage?
    var redSoPageViewController = RedSoPageViewController()
    var item:Int = 0{
        didSet{
            redBeardCollectionView.reloadData()
        }
    }
 
    let redBeardCollectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //cell的寬、高
        layout.itemSize = CGSize(width: 100, height: 40)
        //cell與cell的間距
        layout.minimumLineSpacing = CGFloat(integerLiteral: 50)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: fullScreenY * 0.1, width: fullScreenX, height: fullScreenY * 0.1), collectionViewLayout: layout)
        collectionView.register(RedBeardCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        return collectionView
    }()
    
    lazy var sliderView:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
        view.center = CGPoint(x: 70, y: 71.333)
        view.backgroundColor = #colorLiteral(red: 1, green: 0.003718964041, blue: 0, alpha: 1)
        return view
    }()
    
    lazy var redSoLabel:CustomLabel = {
        let label = CustomLabel()
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        //設定個別顏色
        var labelText = label.text
        labelText = "RedSo"
        let attributedText = NSMutableAttributedString(string: labelText!)
        
        attributedText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 40)!], range: getRangeOfSubString(subString: "Red", fromString: labelText!))

        attributedText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 40)!], range: getRangeOfSubString(subString: "So", fromString: labelText!))
        label.attributedText = attributedText
        return label
    }()
    
    //MARK: - string range
    func getRangeOfSubString(subString: String, fromString: String) -> NSRange {
        let sampleLinkRange = fromString.range(of: subString)!
        let startPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.lowerBound)
        let endPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.upperBound)
        let linkRange = NSMakeRange(startPos, endPos - startPos)
        return linkRange
    }
    
    //MARK: - slider center
    func setSliderPosition(item:Int){
        print("test moving slider")
        guard let cell = redBeardCollectionView.cellForItem(at:IndexPath(item: item, section: 0) )else {
            return
        }
        print("slider\(item)")
        let cellCenter = cell.center
        
        UIView.animate(withDuration: 0.25){
            self.sliderView.center = CGPoint(x: cellCenter.x, y: cellCenter.y + 25)
        }
    }
    
    //MARK:- constraints
    
    func setredSoLabelConstraints(){
        redSoLabel.translatesAutoresizingMaskIntoConstraints = false
        redSoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        redSoLabel.bottomAnchor.constraint(equalTo: redBeardCollectionView.topAnchor).isActive = true
        redSoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redSoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addChild(redSoPageViewController)
        view.addSubview(redSoLabel)
        view.addSubview(redSoPageViewController.view)
        view.addSubview(redBeardCollectionView)
        redSoLabel.verticalAlignment = .Middle
        setredSoLabelConstraints()
        redBeardCollectionView.addSubview(sliderView)
        redBeardCollectionView.delegate = self
        redBeardCollectionView.dataSource = self
        TurnToNetPageDelegate = redSoPageViewController
        redSoPageViewController.scrollToItemDelegate = self
    }
}



extension MainViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = redBeardCollectionView.dequeueReusableCell(withReuseIdentifier:"Cell" , for: indexPath) as!RedBeardCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.teamLabel.text = teamName[indexPath.row]
        
        //點page 移動slider
        print(item)
        setSliderPosition(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        TurnToNetPageDelegate?.turnToNetPage(newPageIndex: indexPath.item)
        
//        移動到該cell的中心
        let cell = redBeardCollectionView.cellForItem(at: indexPath)
        let cellCenter = cell!.center
        UIView.animate(withDuration: 0.25){
            self.sliderView.center = CGPoint(x: cellCenter.x, y: cellCenter.y + 25)
        }
    }
}

//MARK:-翻頁移動scrollView
extension MainViewController:ScrollToItem{
    func scrollToItem(item: Int) {
        redBeardCollectionView.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: true)
        self.item = item
    }
}

protocol TurnToNetPage {
    func turnToNetPage(newPageIndex: Int)
}



