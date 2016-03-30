//
//  SelectDetailViewController.swift
//  AllBooks
//
//  Created by 麻炜怡 on 3/28/16.
//  Copyright © 2016 Weiyi Ma. All rights reserved.
//

import UIKit

class SelectDetailViewController: UIViewController {
    
    lazy var bookImageView: UIImageView = UIImageView()
    lazy var bookAuthor: UILabel = UILabel()
    lazy var author: UILabel = UILabel()
    lazy var bookIsbn: UILabel = UILabel()
    lazy var isbn: UILabel = UILabel()
    lazy var bookYear: UILabel = UILabel()
    lazy var year: UILabel = UILabel()
    lazy var booPages: UILabel = UILabel()
    lazy var pages: UILabel = UILabel()
    lazy var bookLanguage: UILabel = UILabel()
    lazy var language: UILabel = UILabel()
    lazy var bookFileSize: UILabel = UILabel()
    lazy var fileSize: UILabel = UILabel()
    lazy var bookFileFormat: UILabel = UILabel()
    lazy var fileFormat: UILabel = UILabel()
    lazy var bookCategory: UILabel = UILabel()
    lazy var category: UILabel = UILabel()
    lazy var bookDescription: UILabel = UILabel()
    lazy var descriptions: UILabel = UILabel()
    
    var view1: UIView = UIView()
    var view2: UIView = UIView()
    var view3: UIView = UIView()
    
    var topUILabel: UILabel = UILabel()
    
    
    var jsonDictionary: NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.jsonDictionary)
        self.setUpUI()

        // Do any additional setup after loading the view.
    }
    
    
    func setUpUI() {
        
        self.view.addSubview(self.topUILabel)
        self.topUILabel.snp_makeConstraints(closure: {
            make -> Void in
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
            make.top.equalTo(self.view.snp_top)
            make.height.equalTo((self.navigationController?.navigationBar.frame.height)! + UIApplication.sharedApplication().statusBarFrame.height)
        })
       // self.view1.backgroundColor = UIColor.grayColor()
        self.view.addSubview(self.view1)
        self.view1.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.topUILabel.snp_bottom)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_centerX)
            make.bottom.equalTo(self.view.snp_centerY)
        })
        
        self.view1.addSubview(self.bookImageView)
        self.bookImageView.snp_makeConstraints(closure: {
            make -> Void in
            //make.edges.equalTo(self.view1.snp_edges);
            make.top.equalTo(self.view1.snp_top).offset(5)
            make.left.equalTo(self.view1.snp_left).offset(5)
            make.right.equalTo(self.view1.snp_right)
            make.bottom.equalTo(self.view1.snp_bottom)
        })
        
        let bookImageURL = NSURL(string: (jsonDictionary!.valueForKey("bookImage") as! NSArray).objectAtIndex(0) as! String)
        self.bookImageView.kf_setImageWithURL( bookImageURL!, placeholderImage: UIImage(named: "book"))
        
        //self.view2.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.view2)
        self.view2.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.topUILabel.snp_bottom)
            make.left.equalTo(self.view.snp_centerX)
            make.right.equalTo(self.view.snp_right)
            make.bottom.equalTo(self.view.snp_centerY)
            
        })
        
        self.bookAuthor.font = UIFont.boldSystemFontOfSize(14)
        self.bookAuthor.text = "Author:"
        
        self.author.font = UIFont.systemFontOfSize(12)
        self.author.text = (jsonDictionary!.valueForKey("bookAuthor") as! NSArray).objectAtIndex(0) as? String
        //self.author.backgroundColor = UIColor.redColor()
        
        self.view2.addSubview(self.bookAuthor)
        self.view2.addSubview(self.author)
        self.bookAuthor.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.view2.snp_top).offset(25)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.author.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookAuthor.snp_bottom)
        })
        
        self.bookIsbn.font = UIFont.boldSystemFontOfSize(14)
        self.bookIsbn.text = "Isbn:"
        
        self.isbn.font = UIFont.systemFontOfSize(12)
        self.isbn.text = (jsonDictionary!.valueForKey("bookIsbn") as! NSArray).objectAtIndex(0) as? String
        
        self.view2.addSubview(self.bookIsbn)
        self.view2.addSubview(self.isbn)
        self.bookIsbn.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.bookAuthor.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.isbn.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookIsbn.snp_bottom)
        })
        
        self.bookYear.font = UIFont.boldSystemFontOfSize(14)
        self.bookYear.text = "Year:"
        
        self.year.font = UIFont.systemFontOfSize(12)
        self.year.text = (jsonDictionary!.valueForKey("bookYear") as! NSArray).objectAtIndex(0) as? String
        
        self.view2.addSubview(self.bookYear)
        self.view2.addSubview(self.year)
        
        self.bookYear.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.bookIsbn.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.year.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookYear.snp_bottom)
        })
        
        self.booPages.font = UIFont.boldSystemFontOfSize(14)
        self.booPages.text = "Pages:"
        
        self.pages.font = UIFont.systemFontOfSize(12)
        self.pages.text = (jsonDictionary!.valueForKey("bookPages") as! NSArray).objectAtIndex(0) as? String
        
        self.view2.addSubview(self.booPages)
        self.view2.addSubview(self.pages)
        
        self.booPages.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.bookYear.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.pages.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.booPages.snp_bottom)
        })
        
        self.bookLanguage.font = UIFont.boldSystemFontOfSize(14)
        self.bookLanguage.text = "Language:"
        
        self.language.font = UIFont.systemFontOfSize(12)
        self.language.text = (jsonDictionary!.valueForKey("bookLanguage") as! NSArray).objectAtIndex(0) as? String
        
        self.view2.addSubview(self.bookLanguage)
        self.view2.addSubview(self.language)
        
        self.bookLanguage.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.booPages.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.language.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookLanguage.snp_bottom)
        })
        
        self.bookFileSize.font = UIFont.boldSystemFontOfSize(14)
        self.bookFileSize.text = "File Size:"
        
        self.fileSize.font = UIFont.systemFontOfSize(12)
        self.fileSize.text = (jsonDictionary!.valueForKey("bookFileSiz") as! NSArray).objectAtIndex(0) as? String
        
        self.view2.addSubview(self.bookFileSize)
        self.view2.addSubview(self.fileSize)
        
        self.bookFileSize.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.bookLanguage.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.fileSize.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookFileSize.snp_bottom)
        })
        
        self.bookFileFormat.font = UIFont.boldSystemFontOfSize(14)
        self.bookFileFormat.text = "File Format:"
        
        self.fileFormat.font = UIFont.systemFontOfSize(12)
        self.fileFormat.text = "PDF"
        
        self.view2.addSubview(self.bookFileFormat)
        self.view2.addSubview(self.fileFormat)
        
        self.bookFileFormat.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.bookFileSize.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
        })
        
        self.fileFormat.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookFileFormat.snp_bottom)
        })
        
        self.bookCategory.font = UIFont.boldSystemFontOfSize(14)
        self.bookCategory.text = "Category:"
        
        self.category.font = UIFont.systemFontOfSize(12)
        self.category.text = (jsonDictionary!.valueForKey("bookCategory") as! NSArray).objectAtIndex(0) as? String
        //self.category.numberOfLines = 2
        
        self.view2.addSubview(self.bookCategory)
        self.view2.addSubview(self.category)
        
        self.bookCategory.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.fileFormat.snp_bottom).offset(10)
            make.left.equalTo(self.view2.snp_left).offset(20)
            make.width.equalTo(70)
        })
        
        self.category.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.view2.snp_right).offset(-20)
            make.bottom.equalTo(self.bookCategory.snp_bottom)
            make.left.equalTo(self.bookCategory.snp_right).offset(10)
        })
        
        
        
        //self.view3.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(self.view3)
        self.view3.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.view.snp_centerY)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
            make.bottom.equalTo(self.view.snp_bottom)
        })
        
        self.bookDescription.font = UIFont.boldSystemFontOfSize(14)
        self.bookDescription.text = "Book Description:"
        
        self.descriptions.font = UIFont.systemFontOfSize(10)
        let descriptions = jsonDictionary!.valueForKey("bookDescription") as! NSArray
        if descriptions.count == 0 {
            self.descriptions.text = "No description"
        } else {
        self.descriptions.text = (jsonDictionary!.valueForKey("bookDescription") as! NSArray).objectAtIndex(0) as? String
        }
        
        self.descriptions.numberOfLines = 30
        
        self.view3.addSubview(self.bookDescription)
        self.view3.addSubview(self.descriptions)
        
        self.bookDescription.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.view3.snp_top).offset(20)
            make.left.equalTo(self.view3.snp_left).offset(5)
        })
        
        self.descriptions.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.bookDescription.snp_bottom).offset(20)
            make.left.equalTo(self.view3.snp_left).offset(5)
            make.right.equalTo(self.view3.snp_right).offset(-5)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
