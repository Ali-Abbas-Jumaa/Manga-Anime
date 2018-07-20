//
//  ChaptersCollectionViewController.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/6/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "CellManga1"

class ChaptersCollectionViewController: UICollectionViewController {
    @IBOutlet weak var nav: UINavigationItem!
    var id:String?
    var animeTitle:String?
    var mainChapters:[String] = []
    var mangaIDs:[String] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        loadURL()
        

//        let navbar = UINavigationBar()
//        navbar.backgroundColor = UIColor.green
//        navbar.delegate = self as? UINavigationBarDelegate
//        
//        let navItem = UINavigationItem()
//        navItem.title = "Title"
//        //navItem.leftBarButtonItem = UIBarButtonItem(title: "Left Button", style: .plain, target: self, action: nil)
//        navItem.rightBarButtonItem = UIBarButtonItem(title: "Right Button", style: .plain, target: self, action: nil)
//        
//        navbar.items = [navItem]
        
        

    }
   
    
    func loadURL(){
//        DispatchQueue.global().async {
//            
//        }
        
        
        let gradient = GradientView()
        gradient.frame = self.view.bounds
        //add to your collectionView
        collectionView?.addSubview(gradient)
        collectionView?.sendSubview(toBack: gradient)
        self.collectionView?.backgroundView = gradient
        do {
            
            if let _ = id {
                let baseURL = URL(string: "https://www.mangaeden.com/api/manga/\(id!)/")
                let data = try Data(contentsOf: baseURL!)
                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                let chapters = json["chapters"] as! [[Any]]
                for i in 0..<chapters.count {
                    mainChapters.append("\(chapters[i][0])")
                    mangaIDs.append("\(chapters[i][3])")
                }
                print(id!)
            }else{
                print("problem in manga id ")
            }
            
        }catch{
            print("error")
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return mainChapters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! chaptersCollectionViewCell
        cell.numberOfChapter.text = (mainChapters[indexPath.row] )
        cell.mangaID = mangaIDs[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 3)
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let manga = self.storyboard?.instantiateViewController(withIdentifier: "pages") as! PagesCollectionViewController
        let cell = collectionView.cellForItem(at: indexPath) as! chaptersCollectionViewCell
        manga.mangaID = cell.mangaID
        manga.mangaChapterNumber = "\(indexPath.row)"
        
        self.navigationController?.pushViewController(manga, animated: true)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}
