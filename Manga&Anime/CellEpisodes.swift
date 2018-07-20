//
//  CellEpisodes.swift
//  YoutubeAPP
//
//  Created by alnfoth on 5/19/18.
//  Copyright © 2018 alnfoth. All rights reserved.


import UIKit


class CellEpisodes: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    var url:String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        number.layer.masksToBounds = true
//        number.layer.cornerRadius = 5
//        number.layer.borderWidth = 2
//        number.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
