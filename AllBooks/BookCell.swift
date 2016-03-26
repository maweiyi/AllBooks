//
//  TableViewCell.swift
//  AllBooks
//
//  Created by 麻炜怡 on 3/25/16.
//  Copyright © 2016 Weiyi Ma. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    var bookImageView: UIImageView = UIImageView()
    var bookTitle: UILabel = UILabel()
    var bookAuthor: UILabel = UILabel()
    var bookSize: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(bookImageView)
        self.bookImageView.snp_makeConstraints(closure:{
            make -> Void in
            make.top.equalTo(self.contentView).offset(20)
            make.left.equalTo(self.contentView).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(60)
            
        })
        self.contentView.addSubview(bookAuthor)
        self.bookAuthor.snp_makeConstraints(closure: {
            make -> Void in
            make.left.equalTo(self.bookImageView.snp_right).offset(20)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-20)
        })
        self.contentView.addSubview(self.bookSize)
        self.bookSize.snp_makeConstraints(closure: {
            make -> Void in
            make.right.equalTo(self.contentView.snp_right).offset(-20)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-20)
        })
        
        self.bookTitle.numberOfLines = 2
        self.contentView.addSubview(self.bookTitle)
        self.bookTitle.snp_makeConstraints(closure: {
            make -> Void in
            make.top.equalTo(self.contentView.snp_top).offset(20)
            make.left.equalTo(self.bookImageView.snp_right).offset(20)
            make.right.equalTo(self.contentView.snp_right).offset(-20)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
