//
//  SelectionViewController.swift
//  AllBooks
//
//  Created by 麻炜怡 on 3/15/16.
//  Copyright © 2016 Weiyi Ma. All rights reserved.
//

//精选

import UIKit
import MJRefresh
import MBProgressHUD
import Alamofire
import Kingfisher


class SelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jsonDictionary: NSDictionary? = [:]
    var numOfCount: NSInteger = 0
    var selectionModel: SelectionModel = SelectionModel()
    
    //let navbar: UINavigationBar = UINavigationBar()
    let tableView: UITableView = UITableView()
    
    override func viewWillAppear(animated: Bool) {
        print("tttttt")
        //self.loadNewData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.numOfCount = 0
        self.loadNewData()
        print("QQQQQQQ")
        tableView.registerClass(BookCell.self, forCellReuseIdentifier: "ID")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        //self.setUpUINavigationBarUI()
        self.setUpTableViewUI()
        
        let header = MJRefreshNormalHeader(refreshingBlock: {
            self.loadNewData()
        })
        //header.lastUpdatedTimeLabel?.font = UIFont(name: "迷你简瘦金书.ttf", size: 4)
        //header.stateLabel?.font = UIFont(name: "迷你简瘦金书.ttf", size: 4)
        //header.stateLabel?.font.fontWithSize(50.0)
        header.setTitle("下一页", forState: MJRefreshState.Refreshing)
        header.lastUpdatedTimeLabel?.hidden = true
       
        self.tableView.mj_header = header
        
        //header.stateLabel = titleLabel
        
        tableView.mj_header.automaticallyChangeAlpha = true
        
        let footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.loadOldData()
        })
        footer.setTitle("上一页", forState: MJRefreshState.Refreshing)
        footer.automaticallyRefresh = false
        self.tableView.mj_footer = footer
        
        tableView.mj_footer.automaticallyHidden = true
    
       // self.tableView.mj_header.beginRefreshing()
       /* NSTimer.scheduledTimerWithTimeInterval(5,
            target:self,selector:#selector(SelectionViewController.tickDown),
            userInfo:nil,repeats:true)
        NSTimer.scheduledTimerWithTimeInterval(5,
                                               target:self,selector:#selector(SelectionViewController.tickDown1),
                                               userInfo:nil,repeats:true)*/
        
        }
    
    func tickDown1() {
        self.tableView.mj_footer.endRefreshing()
    }
    
    func tickDown() {
        self.tableView.mj_header.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*func setUpUINavigationBarUI() {
        
        let superView = self.view
        //let navbar = UINavigationBar()
        navbar.barTintColor = UIColor(red: 38/255, green: 167/255, blue: 231/255, alpha: 0.0)
        superView.addSubview(navbar)
        navbar.snp_makeConstraints(closure: {
            (make) -> Void in
            make.height.equalTo(64)
            make.width.equalTo(superView)
            make.top.equalTo(superView.snp_top)
        })
        
        let titleLabel = UILabel()
        titleLabel.text = "精选"
        titleLabel.font = UIFont(name: "迷你简瘦金书", size: 20)
        titleLabel.textColor = UIColor.whiteColor()
        
        navbar.addSubview(titleLabel)
        
        titleLabel.snp_makeConstraints(closure: {
            make -> Void in
            make.centerY.equalTo(navbar).offset(11)
            make.centerX.equalTo(navbar)
        })
        
        
    }*/
    
    func setUpTableViewUI() {
        //tableView.backgroundColor = UIColor.redColor()
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.view).offset(0)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view.snp_bottom)
            
        })
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: BookCell = tableView.dequeueReusableCellWithIdentifier("ID", forIndexPath: indexPath) as! BookCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        //cell.textLabel?.text = "Hello World!"
        /*cell.bookImageView.image = UIImage(named: "book")
        cell.bookTitle.font = UIFont.systemFontOfSize(13)
        cell.bookTitle.text = "Building Network and Servers Using Beaglebone"
        cell.bookAuthor.font = UIFont.systemFontOfSize(10)
        cell.bookAuthor.text = "Bill Pretty, Glenn Vander Veer"
        cell.bookSize.font = UIFont.systemFontOfSize(10)
        cell.bookSize.text = "17.7MB"*/
       
        cell.bookTitle.font = UIFont.systemFontOfSize(13)
        cell.bookAuthor.font = UIFont.systemFontOfSize(10)
        cell.bookSize.font = UIFont.systemFontOfSize(10)
        if (self.jsonDictionary?.valueForKey("rows") == nil) {
            cell.bookTitle.text = "Wait..."
            cell.bookImageView.image = UIImage(named: "book")
        } else {
            
            let bookArray = self.jsonDictionary!.valueForKey("rows") as! NSArray
            let bookDictionary = bookArray.objectAtIndex(indexPath.row) as! NSDictionary
            
            let bookImageURL = NSURL(string: (bookDictionary.valueForKey("bookImage") as! NSArray).objectAtIndex(0) as! String)
            cell.bookImageView.kf_setImageWithURL( bookImageURL!, placeholderImage: UIImage(named: "book"))
            cell.bookTitle.text = (bookDictionary.valueForKey("bookTitle") as! NSArray).objectAtIndex(0) as? String
            cell.bookAuthor.text = (bookDictionary.valueForKey("bookAuthor") as! NSArray).objectAtIndex(0) as? String
            
            cell.bookSize.text = (bookDictionary.valueForKey("bookFileSiz") as! NSArray).objectAtIndex(0) as? String
            
            
            /*cell.bookSize.text = self.jsonDictionary!["rows"]!.objectAtIndex(indexPath.row)["bookFileSiz"]!!.objectAtIndex(0)  as? String*/
            
        }
                return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
         hud.color = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
         
         
         hud.labelText = "Loading";
        NSTimer.scheduledTimerWithTimeInterval(5,
                                               target:self,selector:#selector(SelectionViewController.tickDown1s),
                                               userInfo:["indexPath": indexPath.row],repeats:false)*/
        let bookArray = self.jsonDictionary!.valueForKey("rows") as! NSArray
        let bookDictionary = bookArray.objectAtIndex(indexPath.row) as! NSDictionary
        let selectDetailVC: SelectDetailViewController = SelectDetailViewController()
        selectDetailVC.jsonDictionary = bookDictionary
        self.navigationController?.pushViewController(selectDetailVC, animated: false)
    }
    func loadNewData() {
        
        //放置网络请求，AFNetworking
        /*let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.color = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        
        
        hud.labelText = "Loading";
        print("我开始刷新啦!")*/
        
        /*for string in UIFont.familyNames() {
            print(string)
        }*/
        self.numOfCount += 1
        
        Alamofire.request(.GET, "http://192.168.31.164:3000/api/selection", parameters:["id": self.numOfCount], encoding: .URL, headers: nil).responseJSON(completionHandler:{ response in
         //print(response.request)
         //print(response.response)
         if let JSON = response.result.value {
         //print("JSON: \(JSON)")
         self.jsonDictionary = JSON as? NSDictionary
         }
         
         print("PPPPPP")
         //print(self.jsonDictionary!["rows"]![0]["bookFileSiz"]!![0]! as! String)
         //print("PPPPPPP")
         
         self.tableView.reloadData()
         self.tableView.mj_header.endRefreshing()
        })
        
        
        /*NSTimer.scheduledTimerWithTimeInterval(5,
            target:self,selector:#selector(SelectionViewController.tickDown1),
            userInfo:nil,repeats:true)*/
       
        
        
        
        
    }
    
    func loadOldData() {
        self.numOfCount -= 1
        
        if self.numOfCount == 0 {
            self.numOfCount += 1
            let alertVC = UIAlertController(title: "Waring...", message: "没有更多数据", preferredStyle: UIAlertControllerStyle.Alert)
            let action1 = UIAlertAction(title:"确定", style: UIAlertActionStyle.Default , handler: nil)
            alertVC.addAction(action1)
            self.presentViewController(alertVC, animated: true, completion: nil)
            self.tableView.mj_footer.endRefreshing()
        } else {
        
        Alamofire.request(.GET, "http://192.168.31.164:3000/api/selection", parameters:["id": self.numOfCount], encoding: .URL, headers: nil).responseJSON(completionHandler:{ response in
            //print(response.request)
            //print(response.response)
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                self.jsonDictionary = JSON as? NSDictionary
            }
            
            print("PPPPPPoooo")
            //print(self.jsonDictionary!["rows"]![0]["bookFileSiz"]!![0]! as! String)
            //print("PPPPPPP")
            //self.numOfCount += 1
            self.tableView.reloadData()
            self.tableView.mj_footer.endRefreshing()
            
        })}
        
    }
    func tickDown1s(timer: NSTimer) {
        
        let indexPathRow = (timer.userInfo as! NSDictionary).valueForKey("indexPath")! as! NSInteger
        let bookArray = self.jsonDictionary!.valueForKey("rows") as! NSArray
        let bookDictionary = bookArray.objectAtIndex(indexPathRow) as! NSDictionary
        let selectDetailVC: SelectDetailViewController = SelectDetailViewController()
        selectDetailVC.jsonDictionary = bookDictionary
        self.navigationController?.pushViewController(selectDetailVC, animated: false)
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        
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
