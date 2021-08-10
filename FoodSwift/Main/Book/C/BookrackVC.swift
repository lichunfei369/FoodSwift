//
//  BookrackVC.swift
//  FoodSwift
//
//  Created by Apple on 2021/7/13.
//

import UIKit

class BookrackVC: BasicController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.navigationBar.isHidden = true
        navigationController?.barStyle(.clear)
        navigationItem.title = ""
    }
 

}
