//
//  CellAnimes.swift
//  YoutubeAPP
//
//  Created by alnfoth on 5/15/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
import Firebase

class CellAnimes: UITableViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var textAnime: UILabel!
    var snapshot:DocumentSnapshot!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
