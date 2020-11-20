//
//  RedSoCollectionView.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/20.
//

import UIKit

class RedSoCollectionViewController: UICollectionViewController {
    
    var TurnToNetPageDelegate:TurnToNetPage?
    private let teamName = ["Rangers","Elastic","Dynamo"]
    private let reuseIdentifier = "Cell"
    
    private var item:Int = 0{
        didSet{
            setSliderPosition(item: self.item)
        }
    }
    
    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = CGFloat(integerLiteral: 80)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private var sliderView:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
        view.center = CGPoint(x: 70, y: 71.333)
        view.backgroundColor = #colorLiteral(red: 1, green: 0.003718964041, blue: 0, alpha: 1)
        return view
    }()
    
    private func setSliderPosition(item:Int){
        let cell = collectionView.cellForItem(at:IndexPath(item: item, section: 0))
        let cellCenter = cell!.center
        UIView.animate(withDuration: 0.25){
            self.sliderView.center = CGPoint(x: cellCenter.x, y: cellCenter.y + 25)
        }
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: self.layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(sliderView)
        collectionView!.register(RedSoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        collectionView.frame = CGRect(x: 0, y:fullScreenY * 0.1 , width: fullScreenX, height: fullScreenY * 0.1)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RedSoCollectionViewCell
        cell.teamLabel.text = teamName[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(123)
        TurnToNetPageDelegate?.turnToNetPage(newPageIndex: indexPath.item)
        let cell = collectionView.cellForItem(at: indexPath)
        let cellCenter = cell!.center
        UIView.animate(withDuration: 0.25){
            self.sliderView.center = CGPoint(x: cellCenter.x, y: cellCenter.y + 25)
        }
    }
}

extension RedSoCollectionViewController:ScrollToItem{
    func scrollToItem(item: Int) {
        collectionView.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: true)
        self.item = item
    }
}

protocol TurnToNetPage {
    func turnToNetPage(newPageIndex: Int)
}
