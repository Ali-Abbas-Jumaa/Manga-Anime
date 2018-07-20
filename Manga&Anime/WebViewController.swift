//
//  WebViewController.swift
//  Manga&Anime
//
//  Created by alnfoth on 7/6/18.
//  Copyright © 2018 alnfoth. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

   
    @IBOutlet weak var webHtml: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        webHtml.loadRequest(NSURLRequest(URL : NSURL(fileURLWithPath:  Bundle.mainBundle.path(forResource: "Ali", ofType: "html")!) as URL))
        
        let htmlPath = Bundle.main.path(forResource: "Ali", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        webHtml.loadRequest(request)
        
    }
        
}
