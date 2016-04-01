//
//  DiscoverViewController.swift
//  AllBooks
//
//  Created by 麻炜怡 on 3/15/16.
//  Copyright © 2016 Weiyi Ma. All rights reserved.
//
//发现
import UIKit

class DiscoverViewController: UIViewController{
    
    
    var collectionView: UICollectionView?
    
    var collectionLayout: DSCollectionViewLayout?
    
    let cell: UICollectionViewCell? = nil
    
    var cells: [UICollectionViewCell]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionLayout = DSCollectionViewLayout()
        
       
        collectionView = UICollectionView(frame: CGRectMake(0, 0,  self.view.frame.width, self.view.frame.height), collectionViewLayout: self.collectionLayout!)
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.setUpUI()
        

        // Do any additional setup after loading the view.
        
        
        
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.collectionView?.reloadData()
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        
        UIView.animateWithDuration(2.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            
            self.cells![0].center.y += self.view.bounds.width
            self.cells![1].center.y += self.view.bounds.width
            self.cells![2].center.y += self.view.bounds.width
            self.cells![3].center.y += self.view.bounds.width
            }, completion: nil)
        
        print(self.cells?.count)
        self.cells?.removeAll()
        
        print(self.cells?.count)
    }

    override func viewDidDisappear(animated: Bool) {
       print("viewDidDisappear")
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpUI (){
        
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.snp_makeConstraints(closure: {
            make -> Void in
            make.edges.equalTo(self.view.snp_edges)
        })
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        print("!!!!!!111111")
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("5555555")
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        switch indexPath.item {
        case 0:
            cell.backgroundColor = UIColor.redColor()
            cell.layer.cornerRadius = 70
            /*UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                cell.center.y -= self.view.bounds.width
                }, completion: nil)*/
            
            
            UIView.animateWithDuration(16.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: [], animations: {
                cell.center.y -= self.view.bounds.width
                }, completion: nil)
            self.cells?.append(cell)
        case 1:
            cell.backgroundColor = UIColor.greenColor()
            cell.layer.cornerRadius = 70
            /*UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                cell.center.y -= self.view.bounds.width + 98
                cell.center.x -= 98
                }, completion: nil)*/
            
            
            UIView.animateWithDuration(18.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: [], animations: {
                cell.center.y -= self.view.bounds.width + 98
                cell.center.x -= 98
                }, completion: nil)
            self.cells?.append(cell)
        /*case 2:
            cell.backgroundColor = UIColor.yellowColor()
            cell.layer.cornerRadius = 70
            UIView.animateWithDuration(4.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                cell.center.y -= self.view.bounds.width - 98
                cell.center.x += 98
                }, completion: nil)
            self.cells?.append(cell)*/
        case 3:
            cell.backgroundColor = UIColor.blackColor()
            cell.layer.cornerRadius = 70
            /*UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                cell.center.y -= self.view.bounds.width - 98
                cell.center.x -= 98
                }, completion: nil)*/
            
            UIView.animateWithDuration(10.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: [], animations: {
                cell.center.y -= self.view.bounds.width - 98
                cell.center.x -= 98
                }, completion: nil)
            self.cells?.append(cell)
        case 4:
            cell.backgroundColor = UIColor.brownColor()
            cell.layer.cornerRadius = 70
            /*UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                cell.center.y -= self.view.bounds.width + 98
                cell.center.x += 98
                }, completion: nil)*/
            
            UIView.animateWithDuration(15.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: [], animations: {
                cell.center.y -= self.view.bounds.width + 98
                cell.center.x += 98
                }, completion: nil)
            self.cells?.append(cell)
        case 5:
            cell.backgroundColor = UIColor.yellowColor()
            cell.layer.cornerRadius = 70
            /*UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                cell.center.y -= self.view.bounds.width - 98
                cell.center.x += 98
                }, completion: nil)*/
            UIView.animateWithDuration(20.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: [], animations: {
                cell.center.y -= self.view.bounds.width - 98
                cell.center.x += 98
                }, completion: nil)
            self.cells?.append(cell)
        default:
            break
        }
        
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DiscoverViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
}