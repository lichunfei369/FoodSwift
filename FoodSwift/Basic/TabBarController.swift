//
//  TabBarController.swift
//  FoodSwift
//
//  Created by Apple on 2021/7/13.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置选中颜色
        self.tabBar.tintColor = UIColor.black
        //设置tabBar背景颜色
//        self.tabBar.barTintColor = UIColor(red: 41/255.0, green: 42/255.0, blue: 47/255.0, alpha: 1)
        //关闭半透明状态
        tabBar.isTranslucent = false
        setupLayout()
        //设置默认跳到的界面
//        selectedIndex = 0
    }
    
    func setupLayout(){
        //社区
        let communityVC =  CommunityVC()
        addChildController(communityVC,
                           title: "探索",
                           image: UIImage(named: "home"),
                           selectedImage: UIImage(named: "home"))
        //发现
        let homeVC = HomeVC()
        addChildController(homeVC,
                           title: "展厅",
                           image: UIImage(named: "home"),
                           selectedImage: UIImage(named: "home"))
        //书架
        let bookSegmentVC = BookrackVC()
        addChildController(bookSegmentVC,
                           title: "爱车",
                           image: UIImage(named: "home"),
                           selectedImage: UIImage(named: "home"))
 
    
        let mineVC = MineVC()
        addChildController(mineVC,
                           title: "我的",
                           image: UIImage(named: "home"),
                           selectedImage: UIImage(named: "home"))
        
    }

    func addChildController(_ childController:UIViewController,title:String?,image:UIImage?,selectedImage:UIImage?){
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(
            title: title,
            image: image?.withRenderingMode(.alwaysOriginal),
            selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))

        //判断是否是手机设备
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6,
                                                                  left: 0,
                                                                  bottom: -6,
                                                                  right: 0)
        }
        addChild(NavigationVC(rootViewController: childController))
    }
}

extension TabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        guard let select = selectedViewController else {
            return.lightContent
        }
        return select.preferredStatusBarStyle
    }
}
