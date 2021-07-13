//
//  NavigationVC.swift
//  FoodSwift
//
//  Created by Apple on 2021/7/12.
//

//导航栏颜色
enum NavigationBarStyle {
    case theme
    case clear
    case white
}

import UIKit

class NavigationVC: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    func setupLayout(){
        //右滑手势
        guard let interactionGes = interactivePopGestureRecognizer else {
            return
        }
        //ture 执行下面操作 false执行 return
        guard let targetView = interactionGes.view else {
            return
        }
        
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else {
            return
        }
        
        let action = Selector(("handleNavigationTransition:"))
        let fullScreenGesture = UIPanGestureRecognizer(target: internalTargets, action: action)
        fullScreenGesture.delegate = self;
        targetView.addGestureRecognizer(fullScreenGesture)
        interactionGes.isEnabled = false
    }
    
    // push 隐藏标签栏
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0  {
                //tabbar是否可见
                viewController.hidesBottomBarWhenPushed = true
            }
       
        super.pushViewController(viewController, animated: animated)
        
        }
}

extension NavigationVC: UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection
            == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else {
            return true
        }
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1: -1) <= 0 || disablePopGesture {
            return false
        }
        return viewControllers.count != 1;
    }
}

extension NavigationVC {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else { return .lightContent }
        return topVC.preferredStatusBarStyle
    }
}



extension UINavigationController {
    
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    var disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func barStyle(_ style: NavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]

        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]

        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        }
        
        
    }
}
