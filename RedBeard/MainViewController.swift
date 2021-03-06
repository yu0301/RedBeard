//
//  ViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import UIKit

class MainViewController: UIViewController {
    
//    let teamName = ["Rangers","Elastic","Dynamo"]
//    var TurnToNetPageDelegate:TurnToNetPage?
    var redSoPageViewController = RedSoPageViewController()
    lazy var redSoCollectionViewController = RedSoCollectionViewController(collectionViewLayout: layout)
    
    //頁數改變時，slider跟著動
//    var item:Int = 0{
//        didSet{
//            setSliderPosition(item: self.item)
//        }
//    }
 
//
//    let redBeardCollectionView:UICollectionView = {
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = CGFloat(integerLiteral: 80)
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: fullScreenY * 0.1, width: fullScreenX, height: fullScreenY * 0.1), collectionViewLayout: layout)
//        collectionView.register(RedSoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
//        return collectionView
//    }()
    
//    lazy var sliderView:UIView = {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
//        view.center = CGPoint(x: 70, y: 71.333)
//        view.backgroundColor = #colorLiteral(red: 1, green: 0.003718964041, blue: 0, alpha: 1)
//        return view
//    }()
    
    lazy var redSoLabel:UILabel = {
        let label = UILabel()
//        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
//    func setSliderPosition(item:Int){
//        let cell = redBeardCollectionView.cellForItem(at:IndexPath(item: item, section: 0))
//        let cellCenter = cell!.center
//        UIView.animate(withDuration: 0.25){
//            self.sliderView.center = CGPoint(x: cellCenter.x, y: cellCenter.y + 25)
//
//        }
//    }
    
    //MARK: - layout
    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = CGFloat(integerLiteral: 80)
        layout.scrollDirection = .horizontal
        return layout
    }()
    //MARK:- constraints
    
    func setredSoLabelConstraints(){
        redSoLabel.translatesAutoresizingMaskIntoConstraints = false
        redSoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        redSoLabel.bottomAnchor.constraint(equalTo: redSoCollectionViewController.collectionView.topAnchor).isActive = true
        redSoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redSoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

  
//        redSoCollectionViewController.collectionView.frame = CGRect(x: 0, y:fullScreenY * 0.1 , width: fullScreenX, height: fullScreenY * 0.1)
       
        //new collection
        addChild(redSoCollectionViewController)
        view.addSubview(redSoCollectionViewController.view)
        redSoCollectionViewController.didMove(toParent: self)
        
        //加入子視圖控制器
        addChild(redSoPageViewController)
        //子視圖控制器之視圖添加至父視圖控制器視圖
        view.addSubview(redSoPageViewController.view)
        //通知子視圖控制器被加入父視圖控制器
        redSoPageViewController.didMove(toParent: self)
    
        view.addSubview(redSoLabel)
        setredSoLabelConstraints()
        
        
//        view.addSubview(redBeardCollectionView)
//        redBeardCollectionView.addSubview(sliderView)
//        redBeardCollectionView.delegate = self
//        redBeardCollectionView.dataSource = self
        
        redSoCollectionViewController.TurnToNetPageDelegate = redSoPageViewController
        
        //把這串丟給new collectionviewcontroller
        redSoPageViewController.scrollToItemDelegate = redSoCollectionViewController
//        redSoPageViewController.scrollToItemDelegate = self
    }
}



//extension MainViewController:UICollectionViewDataSource,UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = redBeardCollectionView.dequeueReusableCell(withReuseIdentifier:"Cell" , for: indexPath) as!RedSoCollectionViewCell
//        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        cell.teamLabel.text = teamName[indexPath.row]
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        TurnToNetPageDelegate?.turnToNetPage(newPageIndex: indexPath.item)
//
////        移動到該cell的中心
//        let cell = redBeardCollectionView.cellForItem(at: indexPath)
//        let cellCenter = cell!.center
//        UIView.animate(withDuration: 0.25){
//            self.sliderView.center = CGPoint(x: cellCenter.x, y: cellCenter.y + 25)
//        }
//    }
//}

//MARK:-翻頁移動scrollView
//extension MainViewController:ScrollToItem{
//    func scrollToItem(item: Int) {
//        redBeardCollectionView.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: true)
//        self.item = item
//    }
//}





