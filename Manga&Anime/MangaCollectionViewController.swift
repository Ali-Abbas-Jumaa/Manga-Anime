//
//  MangaCollectionViewController.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/4/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

private let reuseIdentifier = "Cell"

class MangaCollectionViewController: UICollectionViewController {
    var mangas:[Manga]=[]
    
    @IBAction func favorit(_ sender: Any) {
        
    }
    @IBOutlet weak var nav: UINavigationItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //let reda = UIColor(hexString: "#8E2DE2")
        let color1 = hexStringToUIColor(hex: "#9a0089")
        self.navigationController?.navigationBar.barTintColor = color1
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

        let gradient = GradientView()
        gradient.frame = self.view.bounds
        //add to your collectionView
        collectionView?.addSubview(gradient)
        collectionView?.sendSubview(toBack: gradient)
        self.collectionView?.backgroundView = gradient
       
        let baseUrl = URL(string: "https://www.mangaeden.com/api/list/0/?p=15&l=30")
    
        if let _ = baseUrl {
            
            Alamofire.request(baseUrl!).validate().responseData{ (response) in
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        if response.result.isSuccess {
                            self.mangas = try decoder.decode(Mangas.self,from: data).manga
                            self.collectionView?.reloadData()
                            print(self.mangas)
                        }else{
                            
                        }
                    }catch{
                        print(error)
                    }
                    
                    
                }
            }
            
        }
        for i in 0..<mangas.count {
            if var _ = mangas[i].im {
            }else{
                mangas.remove(at: i )
                self.collectionView?.reloadData()
                print("one of the images has removed")
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return mangas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MangaCardCollectionViewCell
        cell.label.text = mangas[indexPath.row].t
        cell.id = mangas[indexPath.row].i
        cell.title = mangas[indexPath.row].t
        if let image = mangas[indexPath.row].im {
            cell.mangaPster.kf.setImage(with: URL(string: "https://cdn.mangaeden.com/mangasimg/\(image)") ,placeholder: #imageLiteral(resourceName: "1"), options: [.transition(.fade(0.2))])
        }else{
//            mangas.remove(at: indexPath.row)
//            self.collectionView?.reloadData()
            print("manga removed from the array\(indexPath.row)")
            print("https://cdn.mangaeden.com/mangasimg/\(String(describing: mangas[indexPath.row].im ))")
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 3)
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chapter = self.storyboard?.instantiateViewController(withIdentifier: "chapters") as! ChaptersCollectionViewController
        let cell = collectionView.cellForItem(at: indexPath) as! MangaCardCollectionViewCell
        chapter.id = cell.id
        chapter.animeTitle = cell.title
        
        self.navigationController?.pushViewController(chapter, animated: true)
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

