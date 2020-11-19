//
//  RedSoPageViewController.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/16.
//

import UIKit

class RedSoPageViewController: UIPageViewController {
    
    var scrollToItemDelegate:ScrollToItem!
    
    let tableViewcontroller = [
        RedSoTableViewController(team: .rangers),
        RedSoTableViewController(team: .elastic),
        RedSoTableViewController(team: .dynamo)
    ]
    
    func myClosure(para: String, myClosurePara: (String) -> Void) {
        myClosurePara(para)
    }
    init(){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: fullScreenY * 0.2, width: fullScreenX, height: fullScreenY * 0.8)
        delegate = self
        dataSource = self
        self.setViewControllers([tableViewcontroller[0]], direction: .forward, animated: true, completion: nil)
    }
}

//MARK: - 翻頁移動collectionView
extension RedSoPageViewController:UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //翻頁完 傳值給collectionview
        
        if finished{
            if completed{
                guard let vc = self.viewControllers!.first else { return }
                let item = vc.view.tag
                scrollToItemDelegate.scrollToItem(item: item)
            }
        }
    }
}

extension RedSoPageViewController:UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let tableViewController = viewController as! RedSoTableViewController
        if tableViewController.team.rawValue == 0 {
            return nil
        }else{
            var index = tableViewController.team.rawValue
            index -= 1
            return tableViewcontroller[index]
        }
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        tableViewcontroller.indices.contains(index + 1)
        
        let tableViewController = viewController as! RedSoTableViewController
        if tableViewController.team.rawValue == 2 {
            return nil
        }else{
            var index = tableViewController.team.rawValue
            index += 1
            return tableViewcontroller[index]
        }
    }
}

//MARK: - 移動collectionView翻頁
extension RedSoPageViewController:TurnToNetPage{
    func turnToNetPage(newPageIndex: Int) {
        
        var currentyyPageIndex = self.viewControllers?.first?.view.tag
        
        if newPageIndex != currentyyPageIndex {
            while newPageIndex > currentyyPageIndex!{
                currentyyPageIndex! += 1
                self.setViewControllers([tableViewcontroller[currentyyPageIndex!]], direction: .forward, animated: true, completion: nil)
            }
            while newPageIndex < currentyyPageIndex!{
                currentyyPageIndex! -= 1
                self.setViewControllers([tableViewcontroller[currentyyPageIndex!]], direction: .reverse, animated: true, completion: nil)
            }
        }
    }
}

protocol ScrollToItem{
    func scrollToItem(item:Int)
}
