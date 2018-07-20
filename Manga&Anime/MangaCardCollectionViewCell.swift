//
//  MangaCardCollectionViewCell.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/4/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
@IBDesignable


class MangaCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var mangaPster: UIImageView!
    var id:String?
    var title:String?
    
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 10
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 10)
        
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 5)
//        self.layer.shadowOpacity = 0.4
//        self.layer.shadowPath = shadowPath.cgPath
    }
    
}
