//
//  ViewController.swift
//  AllBooks
//
//  Created by 麻炜怡 on 3/14/16.
//  Copyright © 2016 Weiyi Ma. All rights reserved.
//

import UIKit
import Foundation
import AFNetworking
import SnapKit


class ViewController: UIViewController {
    
    lazy var box = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        let superview = self.view
        let button = UIButton()
        button.layer.cornerRadius = 33
        button.setTitle("+", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        superview.addSubview(button)
        
        let navbar = UINavigationBar()
        navbar.barTintColor = UIColor.redColor()
        superview.addSubview(navbar)
        
        
        button.snp_makeConstraints(closure: {
            (make) -> Void in
            make.width.equalTo(66)
            make.height.equalTo(66)
            make.bottom.equalTo(superview.snp_bottom).offset(-20)
            make.right.equalTo(superview.snp_right).offset(-20)
        })
        
        navbar.snp_makeConstraints(closure: {
            (make) -> Void in
            make.height.equalTo(64)
            make.width.equalTo(superview)
        })
        
        let titleLabel = UILabel()
        navbar.addSubview(titleLabel)
        titleLabel.text = "FunnySnap"
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.sizeToFit()
        titleLabel.snp_makeConstraints(closure: {
            (make) -> Void in
            make.center.equalTo(navbar)
        })
        
        
        let miniView1 = UIView()
        let miniView2 = UIView()
        let miniView3 = UIView()
        miniView1.backgroundColor = UIColor.redColor()
        superview.addSubview(miniView1)
        
        miniView1.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(navbar.snp_bottom).offset(20)
            make.height.equalTo(superview).multipliedBy(0.5)
            make.left.equalTo(superview).offset(20)
            make.right.equalTo(superview).offset(-20)
        })
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //let manager = AFURLSessionManager()
    }
    
    
    
    

}