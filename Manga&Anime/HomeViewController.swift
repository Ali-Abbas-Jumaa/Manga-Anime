//
//  HomeViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-02.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func logOut(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func Anime(_ sender: Any) {
        
        let manga = self.storyboard?.instantiateViewController(withIdentifier: "Anime") as! MainAnimes
        self.navigationController?.pushViewController(manga, animated: true)
        
    }
    
    @IBAction func Manga(_ sender: Any) {
        
        let manga = self.storyboard?.instantiateViewController(withIdentifier: "Manga") as! MangaCollectionViewController
        self.navigationController?.pushViewController(manga, animated: true)
        
    }
    
}
