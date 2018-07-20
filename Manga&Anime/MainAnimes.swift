//
//  MainAnimes.swift
//  YoutubeAPP
//
//  Created by alnfoth on 5/15/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreUI
import SDWebImage
import UserNotifications

class MainAnimes: UITableViewController {
    var db:Firestore!
    var dataSource:FUIFirestoreTableViewDataSource!
    var storage:Storage!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = hexStringToUIColor(hex: "#ab76c1")

        
        let color1 = hexStringToUIColor(hex: "#9a0089")
        self.navigationController?.navigationBar.barTintColor = color1
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        
        db = Firestore.firestore()
        storage = Storage.storage()
        
        let ref = db.collection("animes")
        let query = ref.limit(to: 10)
        
        self.dataSource = tableView.bind(toFirestoreQuery: query, populateCell: { (tableView, indexPath, snapshot) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeCell") as! CellAnimes
            if let data = snapshot.data() {
                
                cell.textAnime.text = data["description"] as? String ?? ""
                //cell.name.text = "kkjsdbnvk"
                cell.name.text = data["name"] as? String ?? ""
                cell.snapshot = snapshot
                if let url = URL(string: data["image"] as? String ?? "") {
                    cell.poster.sd_setImage(with: url)
                }
//                if let refrence = data["posterRefrence"] as? String {
//                    cell.posterImageView.setImage(fromRefrence: refrence)
//                }
            }

            return cell

        })

        
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cartoon = cartoons[indexPath.row]
//        if let cartoonViewController = storyboard?.instantiateViewController(withIdentifier: "CVCID") as? CartoonViewController{
//            cartoonViewController.cartoon = cartoon
//            navigationController?.pushViewController(cartoonViewController, animated: true)
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editorView = self.storyboard?.instantiateViewController(withIdentifier: "Dest") as! MainEpisodes
        
        let cell = tableView.cellForRow(at: indexPath) as! CellAnimes
        
        
        editorView.snapshot = cell.snapshot
        
        self.navigationController?.pushViewController(editorView, animated: true)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = hexStringToUIColor(hex: "#ab76c1")
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
