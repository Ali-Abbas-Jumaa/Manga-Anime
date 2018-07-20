//
//  chaptersCollectionViewCell.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/6/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit

class chaptersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberOfChapter: UILabel!
    var mangaID:String?
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 8
        
    }
    
}
