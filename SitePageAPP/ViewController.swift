//
//  ViewController.swift
//  SitePageAPP
//
//  Created by 井関竜太郎 on 2021/02/01.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    var webView = WKWebView()
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        indicator.isHidden = true
        
        //大きさを決める。
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        
        //これではられる。
        view.addSubview(webView)
        
        //navigatiionを使うことを宣言する。
        webView.navigationDelegate = self
        //URLをロードされる。
        let url = URL(string: "https://github.com/iseruuuuu")
        let request = URLRequest(url: url!)
        webView.load(request)
        indicator.layer.zPosition = 2
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //ロードが完了した時のメソット
        indicator.isHidden = true
        indicator.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //読み込みが開始された時のメソット
        indicator.isHidden = false
        indicator.startAnimating()
    }
    

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
}

