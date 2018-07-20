//
//  CollectioViewController.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/11/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit

class CollectioViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "String", for: indexPath) as UICollectionViewCell
        return cell
    }
    
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let gradient = GradientView()
        gradient.frame = self.view.bounds
        //add to your collectionView
        myCollection?.addSubview(gradient)
        myCollection?.sendSubview(toBack: gradient)
        self.myCollection?.backgroundView = gradient
        
        
    }
    

    

}


