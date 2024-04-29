//
//  ArticleItemTableViewCell.swift
//  Medium
//
//  Created by Blank on 29/4/2567 BE.
//

import UIKit
import Kingfisher

class ArticleItemTableViewCell: UITableViewCell {
    static let identifiedCell = "ArticleItemTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameIcon: UIImageView!
    @IBOutlet weak var icon: UIImageView!
    
    var viewModel: ArticleItemViewModel? {
        didSet {
            guard let item = viewModel else { return }
            
            nameIcon.layer.cornerRadius = 8
            nameLabel.text = item.creator
            titleLabel.text = item.title
            dateLabel.text = item.publishDate
            if let creatorIcon = item.creatorIcon {
                nameIcon.kf.setImage(with: creatorIcon)
                
                nameIcon.backgroundColor = UIColor.clear
            } else {
                nameIcon.backgroundColor = UIColor.gray
            }
            
            icon.backgroundColor = UIColor.gray
            icon.kf.setImage(with: item.thumbnail)
        }
    }
}
