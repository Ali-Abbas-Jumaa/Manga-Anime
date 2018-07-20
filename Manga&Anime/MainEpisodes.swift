//
//  MainEpisodes.swift
//  YoutubeAPP
//
//  Created by alnfoth on 5/19/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreUI

class MainEpisodes: UITableViewController {
    var snapshot:DocumentSnapshot!

    var db:Firestore!
    var dataSource:FUIFirestoreTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = hexStringToUIColor(hex: "#ab76c1")

        
        db = Firestore.firestore()
        
        if let data = snapshot.data(){
            let ref = db.collection(data["episodes"]as! String)
            let query = ref.limit(to: 10)
            
            self.dataSource = tableView.bind(toFirestoreQuery: query, populateCell: { (tableView, indexPath, snapshot) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell") as! CellEpisodes
                if let data = snapshot.data() {
                    
                    cell.number.text = "episode \(data["number"] as? String ?? "")"
                    
                    cell.url = data["url"] as? String
//                    print(data as? String ?? "kjadnfe")
//                    print(data["episodes"] as? String ?? "nil is nil take care ali ")
                    
                    
                }
                
                return cell
                
            })
        }
        
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vedioPlayer = self.storyboard?.instantiateViewController(withIdentifier: "player") as! ViewController
        
        let cell = tableView.cellForRow(at: indexPath) as! CellEpisodes
        
        
        vedioPlayer.url = cell.url!
        
        self.navigationController?.pushViewController(vedioPlayer, animated: true)
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
