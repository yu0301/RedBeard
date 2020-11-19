//
//  RedBeardTableViewCell.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/15.
//

import UIKit

class RedBeardTableViewCell: UITableViewCell {
    var nameArray:[String] = [""]
    var passRangersNameDelegate:PassRangersName?
    var delegate:DidSelectItemAt?
    let teamName = ["Rangers","Elastic","Dynamo"]
    
    let redBeardCollectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //cell的寬、高
        layout.itemSize = CGSize(width: 100, height: 40)
        //cell與cell的間距
        layout.minimumLineSpacing = CGFloat(integerLiteral: 50)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: fullScreenX, height: fullScreenY * 0.1), collectionViewLayout: layout)
        collectionView.register(RedBeardCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return collectionView
    }()
    
    let redBearPageViewController:UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        return pageViewController
    }()
    
    //MARK:- constraints
    func setupPageViewController() {
        addSubview(redBearPageViewController.view)
        self.delegate = self
        redBearPageViewController.setViewControllers([showViewController(0)!], direction: .forward, animated: true, completion: nil)
        redBearPageViewController.delegate = self
        redBearPageViewController.dataSource = self
        
        //constraints
        redBearPageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        redBearPageViewController.view.topAnchor.constraint(equalTo: redBeardCollectionView.bottomAnchor).isActive = true
        redBearPageViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0).isActive = true
        redBearPageViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        redBearPageViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func showViewController(_ index: Int) -> UIViewController? {
        
        let contentVC =  RangersViewController()
        passRangersNameDelegate = contentVC
        passRangersNameDelegate?.passRangersName(name:nameArray)
        return contentVC
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(redBeardCollectionView)
        redBeardCollectionView.dataSource = self
        redBeardCollectionView.delegate = self
        setupPageViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RedBeardTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = redBeardCollectionView.dequeueReusableCell(withReuseIdentifier:"Cell" , for: indexPath) as!RedBeardCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.teamLabel.text = teamName[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAt(newPageIndex: indexPath.item)
        
    }
    
}

extension RedBeardTableViewCell:UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = pageViewController.viewControllers!.first!.view.tag
        
        if index == 0 {
            return nil
        } else {
            index -= 1
            return self.showViewController(index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = pageViewController.viewControllers!.first!.view.tag
        
        //把index帶入判斷式，會得到index + 1的畫面
        if index == 2 {
            return nil
        } else {
            index += 1
            return self.showViewController(index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers!.first else { return }
                let index = vc.view.tag
                redBeardCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredVertically)
                redBeardCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
    }
}

extension RedBeardTableViewCell:DidSelectItemAt{
    func didSelectItemAt(newPageIndex: Int) {
        var currentlyPageIndex =  redBearPageViewController.viewControllers!.first!.view.tag
        
        if newPageIndex != currentlyPageIndex {
            while newPageIndex > currentlyPageIndex{
                currentlyPageIndex += 1
                redBearPageViewController.setViewControllers([showViewController(currentlyPageIndex)!], direction: .forward, animated: true, completion: nil)
            }
            while newPageIndex < currentlyPageIndex{
                currentlyPageIndex -= 1
                redBearPageViewController.setViewControllers([showViewController(currentlyPageIndex)!], direction: .reverse, animated: true, completion: nil)
            }
            
            redBeardCollectionView.scrollToItem(at: IndexPath(item: newPageIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
protocol DidSelectItemAt{
    func didSelectItemAt(newPageIndex: Int)
}
extension RedBeardTableViewCell:PassRangersName{
    func passRangersName(name: [String]) {
        nameArray = name
    }
}
