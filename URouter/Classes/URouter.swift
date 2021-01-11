//
//  URouter.swift
//  URouter
//
//  Created by xjb on 2021/1/6.
//

import Foundation

public class URouter {
    
    public static var share = URouter()
    static var callbackName = Notification.Name("URouter.callback.name")
    
    var routes = [String: UOptions]()
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(toCallback(_:)), name: URouter.callbackName, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: URouter.callbackName, object: nil)
    }
    
    func getController(route name: String, params: Any) -> UIViewController? {
        if let cla = NSClassFromString(name) as? URouteType.Type {
            let vc = cla.target(with: params)
            return vc
        }
        return nil
    }
    
    @objc func toCallback(_ noty: Notification) {
        let back = noty.object
        
        if let name = noty.userInfo?["name"] as? String {
            let callback = routes[name]?.callback
            callback?(back)
        }
    }
}

public extension UIViewController {
    func present(_ name: String, params: Any, animated: Bool = true, callback: ((Any) -> Void)? = nil) {
        guard let targetVC = URouter.share.getController(route: name, params: params) else { return }
        let opt = UOptions(name: name, callback: callback)        
        URouter.share.routes["\(targetVC)"] = opt
        present(targetVC, animated: true, completion: nil)
    }
}

public extension UINavigationController {
    func push(_ name: String, params: Any, animated: Bool = true, callback: ((Any) -> Void)? = nil) {
        guard let targetVC = URouter.share.getController(route: name, params: params) else { return }
        let opt = UOptions(name: name, callback: callback)
        URouter.share.routes[name] = opt
        pushViewController(targetVC, animated: animated)
    }
}
