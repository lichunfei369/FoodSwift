//
//  BookrackVC.swift
//  FoodSwift
//
//  Created by Apple on 2021/7/13.
//

import UIKit

class BookrackVC: SegmentVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.navigationBar.isHidden = false
        navigationController?.barStyle(.clear)
        navigationItem.title = ""
    }
 

}
