//
//  RedSoCollectionView.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class RedSoCollectionView: UICollectionViewController {
    
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    layout.minimumLineSpacing = CGFloat(integerLiteral: 80)
//    layout.scrollDirection = .horizontal
//    let collectionView = UICollectionView(frame: CGRect(x: 0, y: fullScreenY * 0.1, width: fullScreenX, height: fullScreenY * 0.1), collectionViewLayout: layout)
//    collectionView.register(RedBeardCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//    collectionView.showsHorizontalScrollIndicator = false
//    collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        
    
        return cell
    }
   
}
