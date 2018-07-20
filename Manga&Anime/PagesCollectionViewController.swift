//
//  PagesCollectionViewController.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/8/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

private let reuseIdentifier = "CellManga2"

class PagesCollectionViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var nav: UINavigationItem!
    var mangaID:String?
    var mangaChapterNumber:String?
    var images:[String] = []
    //var pages:[[im]] = [[]]
    
    func loadURL(){
        
        print("the manga Id is \(mangaID) ")
        //DispatchQueue.global().async {
            do {
                if let _ = self.mangaID {
                    let baseURL = URL(string: "https://www.mangaeden.com/api/chapter/\(self.mangaID!)/")
                    print("https://www.mangaeden.com/api/chapter/\(self.mangaID!)/")

                    let data = try Data(contentsOf: baseURL!)

                    let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    let im = json["images"] as! [[Any]]
                    print(im)
                    //DispatchQueue.global().async {
                        for i in 0..<im.count {
                            self.images.append("\(im[i][1])")
                        }
                        self.collectionView?.reloadData()
                        print(self.images)
                    //}
                    
                }else{
                    print("problem in manga id ")
                }
                
            }catch{
                print("error")
            }
        //}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()

        
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
//        print(pages.count)
//        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PagesCollectionViewCell
        
        
        
        
        
        
        //cell.label.text = "\(images[indexPath.row][0])"
        
        cell.page.kf.setImage(with: URL(string: "https://cdn.mangaeden.com/mangasimg/\(images[indexPath.row])") ,placeholder: #imageLiteral(resourceName: "1"), options: [.transition(.fade(0.2))])
        

//            cell.label.text = "\(pages[indexPath.row][0])"
//
//            cell.page.kf.setImage(with: URL(string: "https://cdn.mangaeden.com/mangasimg/a1/a132bf14f31244235f16c9474196e3f3b13ccaa6c31b05469c7fd612.png") ,placeholder: #imageLiteral(resourceName: "1"), options: [.transition(.fade(0.2))])
//        //\(pages[indexPath.row][1])
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame .height)
    }

   
}
